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

## Option: `mqtt_retain`

The `mqtt_retain` option defines whether the MQTT broker should retain data sent to it.

## Option: `mqtt_host`

The `mqtt_host` option defines the MQTT host to use. If the MQTT add-on is running, this add-on will use its value by default unless this option is provided.

## Option: `mqtt_password`

The `mqtt_password` option defines the MQTT password to use. If the MQTT add-on is running, this add-on will use its value by default unless this option is provided.

## Option: `mqtt_port`

The `mqtt_port` option defines the MQTT port to use. If the MQTT add-on is running, this add-on will use its value by default unless this option is provided.

## Option: `mqtt_username`

The `mqtt_username` option defines the MQTT username to use. If the MQTT add-on is running, this add-on will use its value by default unless this option is provided.

## Option: `output_unit_accumulated_precipitation`

The `output_unit_accumulated_precipitation` option defines the unit system to use when outputting accumulated precipitation data.

- `in`
- `mm`

## Option: `output_unit_distance`

The `output_unit_distance` option defines the unit system to use when outputting distance data.

- `cm`
- `ft`
- `in`
- `km`
- `m`
- `mi`
- `mm`
- `yd`

## Option: `output_unit_humidity`

The `output_unit_humidity` option defines the unit system to use when outputting absolute humidity data.

- `g/m³`
- `lbs/ft³`

## Option: `output_unit_illuminance`

The `output_unit_illuminance` option defines the unit system to use when outputting illuminance data.

- `fc`
- `kfc`
- `klx`
- `lx`
- `W/m²`
- `%`

## Option: `output_unit_precipitation_rate`

The `output_unit_precipitation_rate` option defines the unit system to use when outputting precipitation rate data.

- `in/h`
- `mm/h`

## Option: `output_unit_speed`

The `output_unit_speed` option defines the unit system to use when outputting speed data.

- `ft/s`
- `in/d`
- `in/h`
- `km/h`
- `kn`
- `m/s`
- `mph`
- `mm/d`

## Option: `precision`

The `precision` option defines the number of decimal points to round units to.

## Option: `verbose`

The `verbose` option enables verbose log output.

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

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=c35f0383_ecowitt2mqtt&repository_url=https%3A%2F%2Fgithub.com%2Fbachya%2Fhome-assistant-addons
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[bachya]: https://github.com/bachya
[commits-shield]: https://img.shields.io/github/commit-activity/y/bachya/home-assistant-addons.svg
[commits]: https://github.com/bachya/home-assistant-addons/commits/main
[contributors]: https://github.com/bachya/home-assistant-addons/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[dockerhub]: https://hub.docker.com/r/bachya/home-assistant-addons
[docs]: https://github.com/bachya/home-assistant-addons/blob/dev/ecowitt2mqtt/DOCS.md
[ecowitt]: http://www.ecowitt.com
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/ecowitt2mqtt-send-data-from-an-ecowitt-device-to-mqtt
[github-actions-shield]: https://github.com/bachya/home-assistant-addons/actions/workflows/builder.yaml/badge.svg?branch=main
[github-actions]: https://github.com/bachya/home-assistant-addons/actions
[issue]: https://github.com/bachya/home-assistant-addons/issues
[license-shield]: https://img.shields.io/github/license/bachya/home-assistant-addons.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2022.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[reddit]: https://reddit.com/r/homeassistant
[releases-shield]: https://img.shields.io/github/release/bachya/home-assistant-addons.svg
[releases]: https://github.com/bachya/home-assistant-addons/releases
[repository]: https://github.com/bachya/home-assistant-addons
[say-thanks-shield]: https://img.shields.io/badge/SayThanks-!-1EAEDB.svg
[say-thanks]: https://saythanks.io/to/bachya
