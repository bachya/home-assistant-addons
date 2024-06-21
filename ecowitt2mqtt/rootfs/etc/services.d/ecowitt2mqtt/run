#!/usr/bin/with-contenv bashio
# ==============================================================================
# Start the ecowitt2mqtt service
# s6-overlay docs: https://github.com/just-containers/s6-overlay
# ==============================================================================

# Get supervisor configuration:
bashio::log.info "Fetching configuration..."

# Grab MQTT parameters from the MQTT add-on:
MQTT_HOST=""
MQTT_PASSWORD=""
MQTT_PORT=1883
MQTT_USERNAME=""

if bashio::services.available "mqtt"; then
  MQTT_HOST="$(bashio::services "mqtt" "host")"
  MQTT_PORT="$(bashio::services "mqtt" "port")"
  MQTT_USERNAME="$(bashio::services "mqtt" "username")"
  MQTT_PASSWORD="$(bashio::services "mqtt" "password")"
fi

# Override the default MQTT parameters if the user has provided values:
if bashio::config.has_value 'mqtt_host'; then
  MQTT_HOST="$(bashio::config 'mqtt_host')"
fi
if bashio::config.has_value 'mqtt_port'; then
  MQTT_PORT="$(bashio::config 'mqtt_port')"
fi
if bashio::config.has_value 'mqtt_username'; then
  MQTT_USERNAME="$(bashio::config 'mqtt_username')"
fi
if bashio::config.has_value 'mqtt_password'; then
  MQTT_PASSWORD="$(bashio::config 'mqtt_password')"
fi

# Fail if we're missing MQTT config:
if [[ -z "${MQTT_HOST}" || -z "${MQTT_PORT}" ]]; then
  bashio::log.fatal "MQTT host configuration not found; cannot continue."
  exit 1
fi

# Log the MQTT parameters:
bashio::log.info "Using MQTT host: ${MQTT_HOST}"
bashio::log.info "Using MQTT port: ${MQTT_PORT}"
if [[ ! -z "${MQTT_USERNAME}" ]]; then
  bashio::log.info "Using MQTT username: ${MQTT_USERNAME}"
  bashio::log.info "Using MQTT password: REDACTED"
  MQTT_USER_ARG="--mqtt-username=${MQTT_USERNAME}"
  MQTT_PASS_ARG="--mqtt-password=${MQTT_PASSWORD}"
else
  bashio::log.info "No MQTT credentials provided."
  MQTT_USER_ARG=""
  MQTT_PASS_ARG=""
fi

# Define config options to use:
ADDL_CONFIG_OPTIONS=()

if bashio::config.has_value 'boolean_battery_true_value'; then
  ADDL_CONFIG_OPTIONS+=(--boolean-battery-true-value="$(bashio::config 'boolean_battery_true_value')")
fi
if bashio::config.has_value 'default_battery_strategy'; then
  ADDL_CONFIG_OPTIONS+=(--default-battery-strategy="$(bashio::config 'default_battery_strategy')")
fi
if bashio::config.true 'diagnostics'; then
  ADDL_CONFIG_OPTIONS+=(--diagnostics)
fi
if bashio::config.true 'disable_calculated_data'; then
  ADDL_CONFIG_OPTIONS+=(--disable-calculated-data)
fi
if bashio::config.has_value 'endpoint'; then
  ADDL_CONFIG_OPTIONS+=(--endpoint="$(bashio::config 'endpoint')")
fi
if bashio::config.has_value 'hass_discovery_prefix'; then
  ADDL_CONFIG_OPTIONS+=(--hass-discovery-prefix="$(bashio::config 'hass_discovery_prefix')")
fi
if bashio::config.has_value 'hass_entity_id_prefix'; then
  ADDL_CONFIG_OPTIONS+=(--hass-entity-id-prefix="$(bashio::config 'hass_entity_id_prefix')")
fi
if bashio::config.has_value 'input_data_format'; then
  ADDL_CONFIG_OPTIONS+=(--input-data-format="$(bashio::config 'input_data_format')")
fi
if bashio::config.has_value 'input_unit_system'; then
  ADDL_CONFIG_OPTIONS+=(--input-unit-system="$(bashio::config 'input_unit_system')")
fi
if bashio::config.has_value 'locale'; then
  ADDL_CONFIG_OPTIONS+=(--locale="$(bashio::config 'locale')")
fi
if bashio::config.true 'mqtt_retain'; then
  ADDL_CONFIG_OPTIONS+=(--mqtt-retain)
fi
if bashio::config.has_value 'output_unit_accumulated_precipitation'; then
  ADDL_CONFIG_OPTIONS+=(--output-unit-accumulated-precipitation="$(bashio::config 'output_unit_accumulated_precipitation')")
fi
if bashio::config.has_value 'output_unit_distance'; then
  ADDL_CONFIG_OPTIONS+=(--output-unit-distance="$(bashio::config 'output_unit_distance')")
fi
if bashio::config.has_value 'output_unit_humidity'; then
  ADDL_CONFIG_OPTIONS+=(--output-unit-humidity="$(bashio::config 'output_unit_humidity')")
fi
if bashio::config.has_value 'output_unit_illuminance'; then
  ADDL_CONFIG_OPTIONS+=(--output-unit-illuminance="$(bashio::config 'output_unit_illuminance')")
fi
if bashio::config.has_value 'output_unit_precipitation_rate'; then
  ADDL_CONFIG_OPTIONS+=(--output-unit-precipitation-rate="$(bashio::config 'output_unit_precipitation_rate')")
fi
if bashio::config.has_value 'output_unit_speed'; then
  ADDL_CONFIG_OPTIONS+=(--output-unit-speed="$(bashio::config 'output_unit_speed')")
fi
if bashio::config.has_value 'output_unit_system'; then
  ADDL_CONFIG_OPTIONS+=(--output-unit-system="$(bashio::config 'output_unit_system')")
fi
if bashio::config.has_value 'precision'; then
  ADDL_CONFIG_OPTIONS+=(--precision="$(bashio::config 'precision')")
fi
if bashio::config.true 'verbose'; then
  ADDL_CONFIG_OPTIONS+=(--verbose)
fi

# Boot up
bashio::log.info "Starting Ecowitt2MQTT"
exec ecowitt2mqtt \
    --mqtt-broker="${MQTT_HOST}" \
    --mqtt-port="${MQTT_PORT}" \
    ${MQTT_USER_ARG} \
    ${MQTT_PASS_ARG} \
    --port=8080 \
    --hass-discovery \
    "${ADDL_CONFIG_OPTIONS[@]}"
