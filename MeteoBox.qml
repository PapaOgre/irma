import QtQml 2.11
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11

import QtQuick.Controls.Material 2.2

Pane {
	padding: 0

	property string location: "London"
	property string key: ""
	property int mainIconSize: 128
	property var meteo_data: ({})

	Rectangle {
		id: topBar
		color: "#44FFFFFF"
		anchors {
			top: parent.top
			left: parent.left
			right: parent.right
		}
		height: children[0].implicitHeight

		RowLayout {
			anchors {
				left: parent.left
				right: parent.right
			}
			Label {
				text: meteo_data["name"] || ""

				Layout.alignment: Qt.AlignRight
				Layout.margins: 8
			}
		}
	}

	Label {
		anchors.centerIn: parent
		font.family: weatherFont.name;
		font.pixelSize: mainIconSize

		text: {
			var code = (meteo_data["cod"] || 0).toString();

			if (code.match(/2../)) { // Thunderstorm
				return "\uf01e";
			} else if (code.match(/3../)) { // Drizzle
				return "\uf009";
			} else if (code.match(/5../)) { // Rain
				return "\uf008";
			} else if (code.match(/5../)) { // Rain
				return "\uf008";
			} else if (code.match(/6../)) { // Snow
				return "\uf00a";
			} else if (code.match(/7../)) { // Atmosphere
				return "\uf014";
			} else if (code.match(/800/)) { // Clear
				return "\uf00d";
			} else if (code.match(/80./)) { // Clouds
				return "\uf041";
			}

			return code;
		}

		Layout.alignment: Qt.AlignHCenter
	}

	Rectangle {
		id: bottomBar
		color: "#44FFFFFF"
		anchors {
			bottom: parent.bottom
			left: parent.left
			right: parent.right
		}
		height: children[0].implicitHeight

		RowLayout {
			anchors {
				left: parent.left
				right: parent.right
			}

			RowLayout {
				Label {
					// Kelvin to Celsius conversion.
					text:
					(meteo_data["main"]["temp_min"] - 273.16).toFixed(1) + "°C — " +
					(meteo_data["main"]["temp_max"] - 273.16).toFixed(1) + "°C"
					Layout.fillWidth: true
					Layout.margins: 8
				}
				Label {
					text: meteo_data["weather"][0]["main"]
					Layout.fillWidth: true
					Layout.margins: 8
				}
			}
		}
	}

	Timer {
		interval: 1000 * 60 * 30
		triggeredOnStart: true
		running: true
		repeat: true
		onTriggered: {
			request("https://samples.openweathermap.org/data/2.5/weather?q=" + location + "&appid=" + key, function(response) {
				if (response.responseText != "")
					meteo_data = JSON.parse(response.responseText);
			})
			bottomMargin: 10
		}
	}

	function request(url, callback) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = (function(myxhr) {
			return function() {
				callback(myxhr);
			}
		})(xhr);
		xhr.open('GET', url, true);
		xhr.send('');
	}
}
