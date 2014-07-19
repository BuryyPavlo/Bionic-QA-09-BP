function Main()
{
  try
  {
    // Enter your code here. 
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}


//add text to new file and check
function Test_add_text()
{ text_in="hellow world"
  out_way="C:\\hellow_world.txt";

  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.Edit.Keys(text_in);
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save As...");
  Aliases.notepad.dlgSaveAs.SaveFile(out_way, "Text Documents (*.txt)");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Exit");
  Delay(500);
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile(out_way, "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, text_in, false);
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Exit");
}

function test_changes_text()
{ out_way="C:\\hellow_world.txt";  //way to file
  text_in="[End]"        // end of file
  text_in2=" abc ";      //new text of file
  
  {//what text in file
   TestedApps.notepad.Run();
   Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
   Aliases.notepad.dlgOpen.OpenFile(out_way, "Text Documents (*.txt)");
   var text=Aliases.notepad.wndNotepad.Edit.wText;
   Aliases.notepad.wndNotepad.MainMenu.Click("File|Exit"); 
   Delay(500);  
  }
  {  //add new text
    TestedApps.notepad.Run();
    Aliases.notepad.wndNotepad.MainMenu.Click("File|Open..."); 
    Aliases.notepad.dlgOpen.OpenFile(out_way, "Text Documents (*.txt)"); 
    Aliases.notepad.wndNotepad.Edit.Keys(text_in+text_in2);
    Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
    Aliases.notepad.wndNotepad.MainMenu.Click("File|Exit");
    Delay(500);
  }  
  {  //test changes
    TestedApps.notepad.Run();
    Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
    Aliases.notepad.dlgOpen.OpenFile(out_way, "Text Documents (*.txt)");
    aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, text+text_in2, false);
    Aliases.notepad.wndNotepad.MainMenu.Click("File|Exit");
  }
}