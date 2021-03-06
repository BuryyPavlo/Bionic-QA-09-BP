function Main()
{
Test_add_text();
test_changes_text();
Del();
}


//add text to new file and check
function Test_add_text()
{ 
  var text_in = "hellow world";
  var out_way = "C:\\hellow_world.txt";
  var notepad = Aliases.notepad.wndNotepad;
  
  Log.AppendFolder("Test_add_text") ;  
  TestedApps.notepad.Run(); 
  notepad.Edit.Keys(text_in);
  notepad.MainMenu.Click("File|Save As...");
  Aliases.notepad.dlgSaveAs.SaveFile(out_way, "Text Documents (*.txt)");
  notepad.MainMenu.Click("File|Exit");
  Delay(500);
  
  TestedApps.notepad.Run(); 
  notepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile(out_way, "Text Documents (*.txt)");
  aqObject.CompareProperty(notepad.Edit.wText, 0, text_in, false);
  notepad.MainMenu.Click("File|Exit");
  Delay(500);
  Log.PopLogFolder();    
}

function test_changes_text()
{ 
  var out_way = "C:\\hellow_world.txt";  //way to file
  var text_in = "[End]"        // end of file
  var text_in2 = " abc ";      //new text of file
  var notepad = Aliases.notepad.wndNotepad;
  Log.AppendFolder("test_changes_text") ;
  {//what text in file
   TestedApps.notepad.Run();
   notepad.MainMenu.Click("File|Open...");
   Aliases.notepad.dlgOpen.OpenFile(out_way, "Text Documents (*.txt)");
   var text=notepad.Edit.wText;
   notepad.MainMenu.Click("File|Exit"); 
   Delay(500);  
  }
  {  //add new text
    TestedApps.notepad.Run();
    notepad.MainMenu.Click("File|Open..."); 
    Aliases.notepad.dlgOpen.OpenFile(out_way, "Text Documents (*.txt)"); 
    notepad.Edit.Keys(text_in+text_in2);
    notepad.MainMenu.Click("File|Save");
    notepad.MainMenu.Click("File|Exit");
    Delay(500);
  }  
  {  //test changes
    TestedApps.notepad.Run();
    notepad.MainMenu.Click("File|Open...");
    Aliases.notepad.dlgOpen.OpenFile(out_way, "Text Documents (*.txt)");
    aqObject.CompareProperty(notepad.Edit.wText, 0, text+text_in2, false);
    notepad.MainMenu.Click("File|Exit");
  }
  Log.PopLogFolder();
}

function Del()
{
  var out_way="C:\\hellow_world.txt";
  var Cmd = Aliases.Cmd.wndConsoleWindowClass;
  Log.AppendFolder("postcondion") ;
  TestedApps.cmd.Run(); 
  Cmd.Keys("del "+out_way+"[Enter]");
  Cmd.Keys("Exit"+"[Enter]"); 
  Log.PopLogFolder();
}
