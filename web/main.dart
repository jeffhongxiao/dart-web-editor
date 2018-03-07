import 'dart:html';
import 'dart:convert' show JSON;

TextAreaElement theEditor;

void main() {
  theEditor = querySelector('#editor');
  theEditor.onKeyUp.listen(handleKeyPress);
  theEditor.text = loadDocument();
  print("[DEBUG] editor's text has length = " + theEditor.text.length.toString());

  DivElement apptitle = querySelector("#toolbar");
  apptitle.text = "Text Editor";

  ButtonInputElement btnClear = querySelector("#btnClearText");
  btnClear.onClick.listen(clearEditor);
}

void clearEditor(MouseEvent event) {
  theEditor.text = "";
  saveDocument();
}

void handleKeyPress(KeyboardEvent event) {
  saveDocument();
}

String loadDocument() {
  String readings = "";
  String jsonString = window.localStorage["MyTextEditor"];
  if (jsonString != null && jsonString.length > 0) {
    readings = JSON.decode(jsonString);
  }
  return readings;
}

void saveDocument() {
  window.localStorage["MyTextEditor"] = JSON.encode(theEditor.value);
}
