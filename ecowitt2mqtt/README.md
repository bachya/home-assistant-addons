# Home Assistant Add-on: ecowitt2mqtt

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE)

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]

[![Github Actions][github-actions-shield]][github-actions]
![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]
[![Say Thanks][say-thanks-shield]][say-thanks]

[![Community Forum][forum-shield]][forum]

<a href="https://www.buymeacoffee.com/bachya1208P" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

# About

`ecowitt2mqtt` is a small CLI/web server that allows [Ecowitt][ecowitt]
device data to be sent to an MQTT broker.

# Installation

1. Click the Home Assistant My button below to open the add-on in your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Start the "ecowitt2mqtt" add-on.
1. Check the logs of the add-on to see if everything started correctly.

# Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

## Option: `default_battery_strategy`

The `default_battery_strategy` option defines the default "strategy" to use when encountering an unknown type of battery. Possible values are:

- `boolean`: values are interpreted as `low`/`ok`
- `numeric`: values are interpreted as voltage remaining
- `percentage`: values are interpreted as the percentage of voltage remaining

## Option: `diagnostics`

The `diagnostics` option logs a diagnostics output and immediately exits the `ecowitt2mqtt` server.

## Option: `disable_calculated_data`

The `disable_calculated_data` option disables the creation of calculated data points (e.g., wind chill, heat index, etc.).

## Option: `endpoint`

The `endpoint` option defines the relative WS View endpoint/path to serve ecowitt2mqtt on.

## Option: `mqtt_discovery_prefix`

The `mqtt_discovery_prefix` option defines the MQTT Discovery prefix to use.

## Option: `hass_entity_id_prefix`

The `hass_entity_id_prefix` option defines a string prefix to prepend on all generated entity IDs.

## Option: `input_unit_system`

The `input_unit_system` option the incoming unit system to use. Possible values are:

- `imperial`
- `metric`

## Option: `output_unit_system`

The `output_unit_system` option defines the unit system to use when outputting to MQTT.

- `imperial`
- `metric`

## Option: `verbose`

The `verbose` option enables verbose log output.

## Option: `mqtt_host`

The `mqtt_host` option defines the MQTT host to use. If the MQTT add-on is running, this add-on will use its value by default unless this option is provided.

## Option: `mqtt_password`

The `mqtt_password` option defines the MQTT password to use. If the MQTT add-on is running, this add-on will use its value by default unless this option is provided.

## Option: `mqtt_port`

The `mqtt_port` option defines the MQTT port to use. If the MQTT add-on is running, this add-on will use its value by default unless this option is provided.

## Option: `mqtt_username`

The `mqtt_username` option defines the MQTT username to use. If the MQTT add-on is running, this add-on will use its value by default unless this option is provided.

# Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord chat server][discord-ha] for general Home
  Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

# Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

We have set up a separate document containing our
[contribution guidelines](.github/CONTRIBUTING.md).

# Authors & Contributors

The original setup of this repository is by [Aaron Bach][bachya].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

# License

MIT License

Copyright (c) 2022 Aaron Bach

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=ecowitt2mqtt&repository_url=https%3A%2F%2Fgithub.com%2Fbachya%2Fhome-assistant-addons
[bachya]: https://github.com/bachya
[contributors]: https://github.com/bachya/home-assistant-addons/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[ecowitt]: http://www.ecowitt.com
[forum]: https://community.home-assistant.io/t/ecowitt2mqtt-send-data-from-an-ecowitt-device-to-mqtt
[issue]: https://github.com/bachya/home-assistant-addons/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/bachya/home-assistant-addons/releases
