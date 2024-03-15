String input = "";

void keyboardInput() { // keyboard detection for input
  println(key, keyCode);
  //  -----numbers and others------             equals           ------alphabet------          apostrophe             space
  if ((keyCode >= 44 && keyCode <= 57) || keyCode == 61 || (keyCode >= 65 && keyCode <= 90) || keyCode == 39 || keyCode == 32 || keyCode == ENTER) {
    input += key;
  }
  //                       vvv !dont delete! vvv
  if (keyCode == BACKSPACE && input.length() > 0) {
    input = input.substring(0, input.length()-1);
  }
}
