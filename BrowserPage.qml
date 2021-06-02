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
        height: parent.height/25
        anchors.top: parent.top
        anchors.left: parent.left
        color: "#191919"

        Button{
            id: backPage
            width: height
            height: parent.height /1.3
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/150
            font.pixelSize: (parent.width+parent.height)/95
            //text: qsTr("<")
            onClicked: {
                webView.goBack()
            }
            background: Rectangle{
                color: "#f5f5f5"
                radius: (root.width+root.height)/250
            }
            Item {
                width: parent.height/1.8
                height: parent.height/1.8
                anchors.centerIn: parent
                rotation: 180
                Image{
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "/img/arrow.png"
                }
            }
        }


        Button{
            id:nextPage
            width: height
            height: parent.height /1.3
            anchors.left: backPage.right
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/150
            font.pixelSize: (parent.width+parent.height)/95
            //text: qsTr(">")
            onClicked: {
                webView.goForward()
            }

            background: Rectangle{
                color: "#f5f5f5"
                radius: (root.width+root.height)/250
            }
            Item {
                width: parent.height/1.8
                height: parent.height/1.8
                anchors.centerIn: parent
                Image{
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "/img/arrow.png"
                }
            }
        }

        Button{
            id:reload
            width: height
            height: parent.height /1.3
            anchors.left: nextPage.right
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/150
            font.pixelSize: (parent.width+parent.height)/95
            //text: qsTr(">")
            onClicked: {
                webView.reload()
            }

            background: Rectangle{
                color: "#f5f5f5"
                radius: (root.width+root.height)/250
            }
            Item {
                width: parent.height/1.8
                height: parent.height/1.8
                anchors.centerIn: parent
                Image{
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "/img/reload.png"
                }
            }
        }

        Button{
            id:home
            width: height
            height: parent.height /1.3
            anchors.left: reload.right
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/150
            font.pixelSize: (parent.width+parent.height)/95
            //text: qsTr("home")
            onClicked: {
                webView.url = "https://google.com"
            }

            background: Rectangle{
                color: "#f5f5f5"
                radius: (root.width+root.height)/250
            }
            Item {
                width: parent.height/1.8
                height: parent.height/1.8
                anchors.centerIn: parent
                Image{
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "/img/home.png"
                }
            }
        }

        Rectangle{
            id:inputAdressRec
            width: home.x + search.x
            height: parent.height /1.5
            anchors.left: home.right
            anchors.verticalCenter: home.verticalCenter
            anchors.margins: (parent.width+parent.height)/90
            color: "#f5f5f5"
            radius: (parent.width+parent.height)/150
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
            width: height
            height: parent.height /1.3
            anchors.right: newTab.left
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/150
            font.pixelSize: parent.height/4
            text: qsTr("Go")
            onClicked: {
                appEngine.search(inputAdress.text);
            }
            background: Rectangle{
                color: "#f5f5f5"
                radius: (root.width+root.height)/250
            }
        }
        Button{
            id:newTab
            width: height
            height: parent.height /1.3
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: (parent.width+parent.height)/150
            font.pixelSize: parent.height/3
            text: qsTr("+")
            onClicked: {
                appEngine.addPage();
            }
            background: Rectangle{
                color: "#f5f5f5"
                radius: (root.width+root.height)/250
            }
        }
    }

    ProgressBar{
        value: webView.loadProgress/100
        width: parent.width
        anchors.top: tools.bottom
        anchors.left: parent.left
        z:1
    }

    WebView{
        id: webView
        url: "https://www.google.com"
        width: parent.width
        height: parent.height-tools.height
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

