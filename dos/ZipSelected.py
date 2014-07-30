from cvsgui.Macro import *
from cvsgui.CvsEntry import *
from cvsgui.ColorConsole import *
import cvsgui.App, os.path, os
import zipfile, string
import datetime

class ZipSelected(Macro):
	def __init__(self):
		Macro.__init__(self, "Zip selected files", MACRO_SELECTION,
			0, "Archive")

	def OnCmdUI(self, cmdui):
		# enable only if 1 regular folder is selected
		sel = cvsgui.App.GetSelection()
		isOnlyExistingFiles = len(sel) > 0
		for s in sel:
			if not s.IsFile() or s.IsMissing():
				isOnlyExistingFiles = 0
				break

		cmdui.Enable(isOnlyExistingFiles)
		if isOnlyExistingFiles:
			cmdui.SetText("Zip selected files")
		else:
			cmdui.SetText("Zip files")

	def Run(self):
		print "Zipping modified files..."
		
		# at this point we are sure we have only one regular folder
		sel = cvsgui.App.GetSelection()

		# find the common top path of the selection
		paths = []		
		for s in sel:
			paths.append(s.GetFullName())
                answer, newtopdir = App.CvsPrompt(os.path.dirname(os.path.commonprefix(paths)), 'Question', \
                                         'Enter the top dir to begin archive', "Archive");
                if answer == 'IDOK':
                        if newtopdir == '':
                                newtopdir = os.path.dirname(os.path.commonprefix(paths));
                        
                else:
                        newtopdir = os.path.dirname(os.path.commonprefix(paths));
                        
		dir = newtopdir;
		
		# we chdir because of Zip which stores with relative paths
		os.chdir(dir)
		zipName = os.path.basename(os.path.abspath(dir)) + datetime.datetime.now().strftime("_%Y%m%d") + ".zip"
		zip = zipfile.ZipFile(zipName, "w", zipfile.ZIP_DEFLATED)

		toppath = dir
		if toppath[-1] != os.sep:
			toppath += os.sep

		console = ColorConsole()
		console  << "\tZipping files :" << '\n\n'
		for s in sel:
			# zip the relative path
			name = string.replace(s.GetFullName(), toppath, ".\\")
			console << kMagenta << name << kNormal << '\n'
			zip.write(name)

		zip.close()
		
		print "\n%d file(s) zipped in:\n%s" % (len(sel), os.path.join(toppath, zipName))
		os.startfile(toppath)

ZipSelected()

