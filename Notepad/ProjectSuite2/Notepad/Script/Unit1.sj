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
{
 //text to file
 var text_in="hellow world"
 //way to file
 var out_way="C:\\hellow_world.txt"
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
  TestedApps.Cmd.Run();
  Aliases.Cmd.wndConsoleWindowClass.Keys("del "+out_way+"[Enter]exit[Enter]");
}
