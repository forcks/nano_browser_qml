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
        width: parent.width
        height: parent.height/25
        anchors.top: parent.top
        anchors.left: parent.left
        color: "#181818"
        RowLayout{
            spacing: 10
            id:tools
            anchors.fill: parent
            Layout.alignment: Qt.AlignCenter
            Button{
                id: backPage
                Layout.preferredWidth: parent.width/25
                Layout.preferredHeight: width
                Layout.minimumWidth: 10
                Layout.minimumHeight: 10

                Layout.maximumWidth: 30
                Layout.maximumHeight: 30

                Layout.fillWidth: true
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
                        //fillMode: Image.PreserveAspectFit
                        source: "/img/arrow.png"
                    }
                }
            }


            Button{
                id:nextPage
                Layout.preferredWidth: parent.width/25
                Layout.preferredHeight: width
                Layout.minimumWidth: 10
                Layout.minimumHeight: 10

                Layout.maximumWidth: 30
                Layout.maximumHeight: 30

                Layout.fillWidth: true
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
                Layout.preferredWidth: parent.width/25
                Layout.preferredHeight: width
                Layout.minimumWidth: 10
                Layout.minimumHeight: 10

                Layout.maximumWidth: 30
                Layout.maximumHeight: 30

                Layout.fillWidth: true
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
                Layout.preferredWidth: parent.width/25
                Layout.preferredHeight: width
                Layout.minimumWidth: 10
                Layout.minimumHeight: 10

                Layout.maximumWidth: 30
                Layout.maximumHeight: 30

                Layout.fillWidth: true
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
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: home.height
                Layout.minimumWidth: 10
                Layout.minimumHeight: 10

                Layout.maximumHeight: 30

                Layout.fillWidth: true
                color: "#f5f5f5"
                radius: (parent.width+parent.height)/150
                TextInput{
                    id:inputAdress
                    width: parent.width - (parent.width+parent.height)/30
                    height: parent.height
                    maximumLength: 65
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width/100
                    font.pixelSize: parent.height/3
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
                Layout.preferredWidth: parent.width/25
                Layout.preferredHeight: width
                Layout.minimumWidth: 10
                Layout.minimumHeight: 10
                font.pixelSize: parent.height/5

                Layout.maximumWidth: 30
                Layout.maximumHeight: 30

                Layout.fillWidth: true
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
                Layout.preferredWidth: parent.width/25
                Layout.preferredHeight: width
                Layout.minimumWidth: 10
                Layout.minimumHeight: 10
                font.pixelSize: parent.height/100

                Layout.maximumWidth: 30
                Layout.maximumHeight: 30

                Layout.fillWidth: true
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
}

