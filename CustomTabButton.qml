import QtQuick 2.12
import QtQuick.Window 2.12
import QtWebView 1.1
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import QtQml 2.15

TabButton{
    id:root
    property var _text: "page"
    height: parent.height
    text: qsTr(_text)
}
