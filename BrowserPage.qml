import QtQuick 2.12
import QtQuick.Window 2.12
import QtWebView 1.1
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import QtQml 2.15

Item {
    id:root
    Rectangle{
        id:tools
        width: parent.width
        height: parent.height/10
        anchors.top: parent.top
        anchors.left: parent.left

        Button{
            id: backPage
            width: parent.width/17
            height: parent.height/4
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/90
            font.pixelSize: (parent.width+parent.height)/95
            text: qsTr("<")
            onClicked: {
                webView.goBack()
            }
            background: Rectangle{
                color: "#C0C0C0"
                radius: (root.width+root.height)/200
            }
        }


        Button{
            id:nextPage
            width: parent.width/17
            height: parent.height/4
            anchors.left: backPage.right
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/90
            font.pixelSize: (parent.width+parent.height)/95
            text: qsTr(">")
            onClicked: {
                webView.goForward()
            }

            background: Rectangle{
                color: "#C0C0C0"
                radius: (root.width+root.height)/200
            }
        }

        Button{
            id:home
            width: parent.width/17
            height: parent.height/4
            anchors.left: nextPage.right
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/90
            font.pixelSize: (parent.width+parent.height)/95
            text: qsTr("home")
            onClicked: {
                webView.url = "https://google.com"
            }

            background: Rectangle{
                color: "#C0C0C0"
                radius: (root.width+root.height)/200
            }
        }

        Rectangle{
            id:inputAdressRec
            width: parent.width/1.6
            height: parent.height/4
            anchors.left: home.right
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/90
            color: "#C0C0C0"
            radius: (parent.width+parent.height)/90
            TextInput{
                id:inputAdress
                width: parent.width - (parent.width+parent.height)/30
                height: parent.height
                maximumLength: 65
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: (parent.width+parent.height)/30
                font.pixelSize: (parent.width+parent.height)/65
                verticalAlignment: Text.AlignVCenter
                selectByMouse: true
                autoScroll: false
                color: "#000000"
                onAccepted: {
                    appEngine.search(inputAdress.text);
                }
                Connections{
                    target: appEngine
                    function onSetUrlInSearchInput(url){
                        inputAdress.text = url
                    }
                }
            }
        }
        Button{
            id:search
            width: parent.width/20
            height: parent.height/4
            anchors.left: inputAdressRec.right
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/90
            font.pixelSize: (parent.width+parent.height)/95
            text: qsTr("Go")
            onClicked: {
                appEngine.search(inputAdress.text);
            }
            background: Rectangle{
                color: "#C0C0C0"
                radius: (root.width+root.height)/200
            }
        }
        Button{
            id:newTab
            width: parent.width/20
            height: parent.height/4
            anchors.left: search.right
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/90
            font.pixelSize: parent.height/7
            text: qsTr("+")
            onClicked: {
                appEngine.addPage();
            }
            background: Rectangle{
                color: "#C0C0C0"
                radius: (root.width+root.height)/200
            }
        }
        ProgressBar{
            value: webView.loadProgress/100
            width: parent.width
            height:parent.height/6
            anchors.top: search.bottom
            anchors.left: parent.left
        }
    }

    WebView{
        id: webView
        url: "https://www.google.com"
        width: parent.width
        height: (parent.height / 10) * 9 - ((parent.height / 30) + (parent.height / 30))
        anchors.top: tools.bottom
        anchors.left: parent.left
        onUrlChanged: {
            appEngine.getUrl(webView.url);
        }

        Connections{
            target: appEngine
            function onSetUrl(url){
                webView.url = url
            }
        }
    }
}
