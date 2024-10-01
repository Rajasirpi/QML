import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 1000
    height: 800
    title: qsTr("List Window")
    color: "#FFFFFF"

    ColumnLayout {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        spacing: 5

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 20
        }

        RowLayout {
            Layout.fillWidth: true

            Item {
                Layout.preferredWidth: 45
            }

            // Manager Header
            Rectangle {
                color: "#41A3B8"
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                radius: 10
                opacity:0.9

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10

                    Text {
                        text: "Manager"
                        font.pixelSize: 20
                        color: "white"
                        //opacity: 0.5
                        font.weight: Font.Bold
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Button {
                        icon.source: "qrc:/icons/neu.png"
                        icon.height: 16
                        text: " New"
                        font.weight: Font.Bold
                        Layout.alignment: Qt.AlignRight
                    }
                    Button {
                        enabled: false
                        icon.source: "qrc:/icons/andern.png"
                        icon.height: 16
                        text: " Ändern"
                        font.weight: Font.Bold
                        Layout.alignment: Qt.AlignRight
                    }
                    Button {
                        enabled: false
                        icon.source: "qrc:/icons/technologie.png"
                        icon.height: 16
                        text: " Technologie"
                        font.weight: Font.Bold
                        Layout.alignment: Qt.AlignRight
                    }
                    Button {
                        enabled: false
                        icon.source: "qrc:/icons/update.png"
                        icon.height: 16
                        text: " Update"
                        font.weight: Font.Bold
                        Layout.alignment: Qt.AlignRight
                    }
                    Button {
                        enabled: true
                        icon.source: "qrc:/icons/loschen.png"
                        icon.height: 16
                        text: " Löschen"
                        font.weight: Font.Bold
                        Layout.alignment: Qt.AlignRight
                    }
                }
            }

            Item {
                Layout.preferredWidth: 45
            }
        }

        RowLayout {
            Layout.fillWidth: true

            Item {
                Layout.preferredWidth: 45
            }

            // Filter Row
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                radius: 10

                ColumnLayout {
                    anchors.fill: parent

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10


                        ComboBox {
                            id: machineComboBox
                            width: 150
                            model: ["Alle Maschinen", "Maschine 1", "Maschine 2"]
                            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                        }

                        ComboBox {
                            id: toolComboBox
                            width: 150
                            model: ["Alle WZ", "WZ 1", "WZ 2"]
                            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                        }

                        Button {
                            id: searchButton
                            icon.source: "qrc:/icons/search.png"
                            icon.height: 16
                            text: "                     "
                            Layout.alignment: Qt.AlignHCenter

                            RowLayout {
                                anchors.fill: parent
                                anchors.verticalCenter: parent.verticalCenter
                                spacing: 5

                                TextInput {
                                    id: searchInput
                                    text: "                 "
                                    color: "gray"
                                    anchors.verticalCenter: parent.verticalCenter
                                    padding: 30
                                    Layout.fillWidth: true
                                    //verticalAlignment: TextInput.AlignVCenter
                                    //selectByMouse: true

                                    onTextChanged: {
                                        if (searchInput.text === "  ") {
                                            searchInput.color = "gray";
                                        } else {
                                            searchInput.color = "black";
                                        }
                                    }

                                    onFocusChanged: {
                                        if (focus === true && searchInput.text === " ") {
                                            searchInput.text = "";
                                            searchInput.color = "black";
                                        }
                                    }
                                }
                            }

                            onClicked: {
                                var userInput = searchInput.text.trim();
                                console.log("Search term:", userInput);
                                // Add your search logic here
                            }
                        }


                        Item {
                            Layout.fillWidth: true
                        }

                        Button {
                            enabled: false
                            icon.source: "qrc:/icons/vorschau.png"
                            icon.height: 16
                            text: " Vorschau"
                            font.weight: Font.Bold
                            Layout.alignment: Qt.AlignRight
                        }

                        Button {
                            enabled: true
                            icon.source: "qrc:/icons/tool_manager.png"
                            icon.height: 16
                            text: " Tool Manager"
                            font.weight: Font.Bold
                            Layout.alignment: Qt.AlignRight
                        }

                        Button {
                            enabled: true
                            icon.source: "qrc:/icons/schliesen.png"
                            icon.height: 16
                            text: " Schließen"
                            font.weight: Font.Bold
                            Layout.alignment: Qt.AlignRight
                        }
                    }
                }
                Item {
                    Layout.preferredWidth: 45
                }
            }
            Item {
                Layout.preferredWidth: 65
            }
        }

        // Table Section
        Rectangle {
            color: "white"
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 10
            border.color: "gray"
            border.width: 1

            Flickable {
                id: flickable
                anchors.fill: parent
                contentWidth: parent.width
                contentHeight: tableModel.count * 10

                ColumnLayout {
                    id: tableContent
                    width: parent.width
                    spacing: 5

                    // Table Header
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 5
                        Item {
                            Layout.preferredWidth: 45
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 40
                            color: "black"
                            //color: "#4CAA83"
                            //opacity: 0.7
                            CheckBox {
                                id: selectAllCheckBox
                                anchors.centerIn: parent
                                onCheckedChanged: {
                                    for (var i = 0; i < tableModel.count; i++) {
                                        tableModel.setProperty(i, "selected", checked)
                                    }
                                }
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 40
                            color: "black"
                            //color: "#4CAA83"
                            //opacity: 0.7
                            Text {
                                text: "ID"
                                color: "#FEFEFE"
                                anchors.centerIn: parent
                                font.weight: Font.Bold
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 40
                            color: "black"
                            //color: "#4CAA83"
                            //opacity: 0.7
                            Text {
                                text: "Assembly Name"
                                color: "#FEFEFE"
                                anchors.centerIn: parent
                                font.weight: Font.Bold
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 40
                            color: "black"
                            //color: "#4CAA83"
                            //opacity: 0.7
                            Text {
                                text: "Tool Name"
                                color: "#FEFEFE"
                                anchors.centerIn: parent
                                font.weight: Font.Bold
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 40
                            color: "black"
                            //color: "#4CAA83"
                            //opacity: 0.7
                            Text {
                                text: "Holder Name"
                                color: "#FEFEFE"
                                anchors.centerIn: parent
                                font.weight: Font.Bold
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 40
                            color: "black"
                            //color: "#4CAA83"
                            //opacity: 0.7
                            Text {
                                text: "Dia."
                                color: "#FEFEFE"
                                anchors.centerIn: parent
                                font.weight: Font.Bold
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 40
                            color: "black"
                            //color: "#4CAA83"
                            //opacity: 0.7
                            Text {
                                text: "Cor. Rad."
                                color: "#FEFEFE"
                                anchors.centerIn: parent
                                font.weight: Font.Bold
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 40
                            color: "black"
                            //color: "#4CAA83"
                            //opacity: 0.7
                            Text {
                                text: "Length"
                                color: "#FEFEFE"
                                anchors.centerIn: parent
                                font.weight: Font.Bold
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 40
                            color: "black"
                            //color: "#4CAA83"
                            //opacity: 0.7
                            Text {
                                text: "# Flutes"
                                color: "#FEFEFE"
                                anchors.centerIn: parent
                                font.weight: Font.Bold
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredWidth: 100
                            Layout.preferredHeight: 40
                            color: "black"
                            //color: "#4CAA83"
                            //opacity: 0.7
                            Text {
                                text: "Type"
                                color: "#FEFEFE"
                                anchors.centerIn: parent
                                font.weight: Font.Bold
                            }
                        }
                        Item {
                            Layout.preferredWidth: 45
                        }
                    }

                    // Table Rows
                    Repeater {
                        model: ListModel {
                            id: tableModel
                            ListElement { selected: false; l_id: 19476; assemblyName: "GARANT"; toolName: "Tool1"; holderName: "Holder1"; diameter: 8.00; cornerRadius: 0.50; length: 28.00; flutes: 4; radius: 4; type: "Corner" }
                            ListElement { selected: false; l_id: 19477; assemblyName: "GARANT"; toolName: "Tool2"; holderName: "Holder2"; diameter: 10.00; cornerRadius: 1.00; length: 30.00; flutes: 5; radius: 5; type: "Flat" }
                            // Add more entries as needed
                        }
                        ColumnLayout{

                            RowLayout {
                                Layout.fillWidth: true
                                spacing: 5
                                Item {
                                    Layout.preferredWidth: 45
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredWidth: 50
                                    Layout.preferredHeight: 40
                                    color: "#FEFEFE"
                                    //border.color: "gray"
                                    CheckBox {
                                        anchors.centerIn: parent
                                        checked: model.selected
                                        onCheckedChanged: {
                                            tableModel.set(model.index, {"selected": checked})
                                        }
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredWidth: 50
                                    Layout.preferredHeight: 40
                                    color: "#FEFEFE"
                                    //border.color: "gray"
                                    Text {
                                        text: model.l_id
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredWidth: 150
                                    Layout.preferredHeight: 40
                                    color: "#FEFEFE"
                                    //border.color: "gray"
                                    Text {
                                        text: model.assemblyName
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredWidth: 150
                                    Layout.preferredHeight: 40
                                    color: "#FEFEFE"
                                    //border.color: "gray"
                                    Text {
                                        text: model.toolName
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredWidth: 150
                                    Layout.preferredHeight: 40
                                    color: "#FEFEFE"
                                    //border.color: "gray"
                                    Text {
                                        text: model.holderName
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredWidth: 50
                                    Layout.preferredHeight: 40
                                    color: "#FEFEFE"
                                    //border.color: "gray"
                                    Text {
                                        text: model.diameter
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredWidth: 50
                                    Layout.preferredHeight: 40
                                    color: "#FEFEFE"
                                    //border.color: "gray"
                                    Text {
                                        text: model.cornerRadius
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredWidth: 50
                                    Layout.preferredHeight: 40
                                    color: "#FEFEFE"
                                    //border.color: "gray"
                                    Text {
                                        text: model.length
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredWidth: 50
                                    Layout.preferredHeight: 40
                                    color: "#FEFEFE"
                                    //border.color: "gray"
                                    Text {
                                        text: model.flutes
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredWidth: 100
                                    Layout.preferredHeight: 40
                                    color: "#FEFEFE"
                                    //border.color: "gray"
                                    Text {
                                        text: model.type
                                        anchors.centerIn: parent
                                    }
                                }
                                Item {
                                    Layout.preferredWidth: 45
                                }
                            }
                            RowLayout {
                                Layout.fillWidth: true
                                Item {
                                    Layout.preferredWidth: 45
                                }
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 1
                                    color: "#41A3B8"
                                    opacity: 0.2
                                }
                                Item {
                                    Layout.preferredWidth: 45
                                }
                            }
                        }
                    }

                    Item {
                        Layout.preferredWidth: 45
                    }
                }
            }
        }
    }
}

