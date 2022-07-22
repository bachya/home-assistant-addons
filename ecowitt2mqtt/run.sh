#!/usr/bin/with-contenv bashio

# Get supervisor configuration:
bashio::log.info "Fetching configuration..."

# Grab MQTT parameters from the MQTT add-on:
MQTT_HOST=""
MQTT_PASSWORD=""
MQTT_PORT=1883
MQTT_UERSNAME=""

if bashio::services.available "mqtt"; then
  MQTT_HOST="$(bashio::services "mqtt" "host")"
  MQTT_PORT="$(bashio::services "mqtt" "port")"
  MQTT_UERSNAME="$(bashio::services "mqtt" "username")"
  MQTT_PASSWORD="$(bashio::services "mqtt" "password")"
fi

# Override the default MQTT parameters if the user has provided values:
if bashio::config.has_value 'mqtt_host'; then
  MQTT_HOST="$(bashio::config 'mqtt_host')"
fi
if bashio::config.has_value 'mqtt_port'; then
  MQTT_PORT="$(bashio::config 'mqtt_port')"
fi
if bashio::config.has_value 'mqtt_user'; then
  MQTT_UERSNAME="$(bashio::config 'mqtt_user')"
fi
if bashio::config.has_value 'mqtt_pass'; then
  MQTT_PASSWORD="$(bashio::config 'mqtt_pass')"
fi

# Fail if we're missing MQTT config:
if [[ -z "${MQTT_HOST}" || -z "${MQTT_PORT}" || -z "${MQTT_UERSNAME}" || -z "${MQTT_PASSWORD}" ]]; then
  bashio::log.fatal "MQTT configuration not found; cannot continue."
  exit 1
fi

# Log the MQTT parameters:
bashio::log.info "Using MQTT host: ${MQTT_HOST}"
bashio::log.info "Using MQTT port: ${MQTT_PORT}"
bashio::log.info "Using MQTT username: ${MQTT_UERSNAME}"
bashio::log.info "Using MQTT password: REDACTED"

# Define config options to use:
ADDL_CONFIG_OPTIONS=()

if bashio::config.has_value 'default_battery_strategy'; then
  ADDL_CONFIG_OPTIONS+=(--default-battery-strategy="$(bashio::config 'default_battery_strategy')")
fi
if bashio::config.has_value 'diagnostics'; then
  ADDL_CONFIG_OPTIONS+=(--diagnostics)
fi
if bashio::config.has_value 'endpoint'; then
  ADDL_CONFIG_OPTIONS+=(--endpoint="$(bashio::config 'endpoint')")
fi
if bashio::config.has_value 'hass_discovery_prefix'; then
  ADDL_CONFIG_OPTIONS+=(--hass-discovery-prefix="$(bashio::config 'hass-discovery-prefix')")
fi
if bashio::config.has_value 'hass_entity_id_prefix'; then
  ADDL_CONFIG_OPTIONS+=(--hass-entity-id-prefix="$(bashio::config 'hass_entity_id_prefix')")
fi
if bashio::config.has_value 'input_unit_system'; then
  ADDL_CONFIG_OPTIONS+=(--input-unit-system="$(bashio::config 'input_unit_system')")
fi
if bashio::config.has_value 'output_unit_system'; then
  ADDL_CONFIG_OPTIONS+=(--output-unit-system="$(bashio::config 'output_unit_system')")
fi
if bashio::config.has_value 'verbose'; then
  ADDL_CONFIG_OPTIONS+=(--verbose)
fi

# Boot up
bashio::log.info "Starting Ecowitt2MQTT"
ecowitt2mqtt \
    --mqtt-broker="${MQTT_HOST}" \
    --mqtt-port="${MQTT_PORT}" \
    --mqtt-username="${MQTT_UERSNAME}" \
    --mqtt-password="${MQTT_PASSWORD}" \
    --port=8080 \
    "${ADDL_CONFIG_OPTIONS[@]}"
