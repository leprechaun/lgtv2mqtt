# lgtv2mqtt

[![mqtt-smarthome](https://img.shields.io/badge/mqtt-smarthome-blue.svg)](https://github.com/mqtt-smarthome/mqtt-smarthome)
[![NPM version](https://badge.fury.io/js/lgtv2mqtt.svg)](http://badge.fury.io/js/lgtv2mqtt)
[![Dependencies Status](https://david-dm.org/hobbyquaker/lgtv2mqtt/status.svg)](https://david-dm.org/hobbyquaker/lgtv2mqtt)
[![Build Status](https://travis-ci.org/hobbyquaker/lgtv2mqtt.svg?branch=master)](https://travis-ci.org/hobbyquaker/lgtv2mqtt)
[![XO code style](https://img.shields.io/badge/code_style-XO-5ed9c7.svg)](https://github.com/sindresorhus/xo)
[![License][mit-badge]][mit-url]

> Interface between LG WebOS Smart TVs and MQTT 📺

### Getting started

-   TV configuration

You need to allow "LG Connect Apps" on your TV - see http://www.lg.com/uk/support/product-help/CT00008334-1437131798537-others

- lgtv2mqtt Configuration

You will need to specify the following ENV variables
    - `TOPIC_PREFIX`: a string to be prepended to the MQTT topic hierachy this tool relies on
    - `MQTT_HOST`: the hostname and port of the MQTT broker (eg, mqtt://mybroker.com)
    - `TV_IP`: The IP or hostname of the LG TV
    - `TV_CLIENT_KEY`: (optional) the key that allows this software to remain authenticated with the LG TV after authorizing on the unit. You can extract this value from `~/.lgtv2/`. See https://github.com/hobbyquaker/lgtv2?tab=readme-ov-file#options


-   Install

`npm install -g lgtv2mqtt`

-   Start

`lgtv2mqtt --help`

### Topics subscribed by lgtv2mqtt

Topics and Payloads follow [mqtt-smarthome Architecture](https://github.com/mqtt-smarthome/mqtt-smarthome).

#### lgtv/set/mute

Enable or disable mute. Payload should be one off '0', '1', 'false' and 'true'.

#### lgtv/set/volume

Set volume. Expects value between 0 and 100.

#### lgtv/set/toast

Show a Popup Message. Send Message as plain payload string.

#### lgtv/set/launch

Lauch an app. Send AppId as plain payload string.

#### lgtv/set/system_launch

Same as lgtv/set/launch, but you can send full json as payload

#### lgtv/set/am_launch_json

Same as lgtv/set/system_launch, but launch with applicationManager instead of system.launcher

#### lgtv/set/media.controls/play

#### lgtv/set/media.controls/pause

#### lgtv/set/media.controls/stop

#### lgtv/set/media.controls/rewind

#### lgtv/set/media.controls/fastForward

#### lgtv/set/system/turnOff

#### lgtv/set/com.webos.service.tv.display/set3DOn

#### lgtv/set/com.webos.service.tv.display/set3DOff

#### lgtv/set/move lgtv/set/drag

Send coordinates as JSON with attributes dx and dy of type number

Example payload: `{"dx": 100, "dy": 0}`

#### lgtv/set/scroll

Send coordinates as JSON with attributes dx and dy of type number

#### lgtv/set/click

#### lgtv/set/button

Send button as plain string payload

Buttons that are known to work:
MUTE, RED, GREEN, YELLOW, BLUE, HOME, MENU, VOLUMEUP, VOLUMEDOWN, CC, BACK, UP, DOWN, LEFT, ENTER, DASH, 0-9, EXIT,
channelup, channeldown, record

#### lgtv/set/youtube

Youtube video ID as payload. Runs youtube app and opens video. If the payload is empty, just launch youtube app.

#### lgtv/set/netflix

Netflix video ID as payload. Runs netflix app and opens video. If the payload is empty, just launch Netflix app.

#### lgtv/set/amazon_prime

Just launch Amazon Prime app, not sure how to open a content directly on it yet.

#### lgtv/set/plex

Just launch Plex app, not sure how to open a content directly on it yet.

#### lgtv/set/web_video_caster

Just launch Web Video Caster app, not sure how to open a content directly on it yet.

#### lgtv/set/open

Open URL within browser.

#### lgtv/set/open_max

Open URL within browser and maximise the window.

#### lgtv/set/power

Payload '1' or 'true': Power ON, using Wake on Lan, must set Environment Variables: BROADCAST_IP and TV_MAC  
Payload '0' or 'false': Power OFF

### topics published by lgtv2mqtt

#### lgtv/status/volume

Reports volume changes. Payload is the plain value.

#### lgtv/status/mute

Reports mute changes. Payload is '0' (not muted) or '1' (muted).

#### lgtv/status/foregroundApp

Reports which App is currently in foreground. (example Payloads: 'netflix', 'com.webos.app.livetv', 'com.webos.app.hdmi2')

#### lgtv/status/currentChannel

Reports current channel if foregroundApp is 'com.webos.app.livetv'. Payload is a JSON String, property val contains the
channelNumber, underneath 'lgtv' you will find more properties with detailed information.

## License

MIT © [Sebastian Raff](https://github.com/hobbyquaker)

[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: LICENSE
