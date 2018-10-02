import QtQml 2.11
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11

import QtQuick.Controls.Material 2.2

Window {
	width: 100
	height: 100

	minimumWidth: 600
	minimumHeight: 400

	Material.theme: Material.Dark

	FontLoader {
		id: weatherFont
		source: "weather-icons-master/font/weathericons-regular-webfont.ttf"
	}

	Pane {
		anchors.fill: parent

		MeteoBox {
			width: 300
			height: 250
			key: "lala"
		}

		MeteoBox {
			x: 320
			y: 70
			width: 260
			height: 220
			mainIconSize: 72
			key: "lala"
		}

		/*
		Button {
			text: "Options"

			anchors {
				right: parent.right
				bottom: parent.bottom
			}
		}
		*/
	}
}

