import QtQuick 2.12
import QtQuick.Window 2.12
import QtWebView 1.1
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import QtQml 2.15

ApplicationWindow {
    id:root
    width: 640
    height: 480
    visible: true
    title: qsTr("Browser")

    //property var tabPage: TabButton {height: (root.height / 30);text: qsTr("new page")}



    StackLayout {
        id:page
        width: parent.width
        height: parent.height - tabbar.height
        anchors.top: parent.top
        anchors.left: parent.left
        z:0
        currentIndex: tabbar.currentIndex
        Repeater{
            model: tabbar.count
            BrowserPage{
                id:browserPage
                Layout.fillHeight : true
                Layout.fillWidth : true
            }
        }
    }
    footer:
        TabBar{
        id:tabbar
        width: parent.width
        //anchors.top: page.bottom

        Connections{
            target: appEngine
            function onSetPage(){
                var obj = Qt.createComponent("CustomTabButton.qml")
                var obj2 = obj.createObject(tabbar,{_text:"page "+(tabbar.count+1),index:tabbar.count});
                tabbar.addItem(obj2)
            }

            function onDestroyPage(index){
                if(index != 0 ){
                    var _removeItem = tabbar.itemAt(index);
                    tabbar.removeItem(_removeItem);
                    tabbar.setCurrentIndex(0)
                }
            }
        }
    }
}














