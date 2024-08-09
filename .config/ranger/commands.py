# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command
from ranger.core.loader import CommandLoader

class fzf_locate(Command):
    def execute(self):
        import subprocess
        if self.quantifier:
            command = "locate home media | fzf -e -i"
        else:
            command = "locate home media | fzf -e -i"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

class fzf_locate_whole(Command):
    def execute(self):
        import subprocess
        if self.quantifier:
            command = "locate / | fzf -e -i"
        else:
            command = "locate / | fzf -e -i"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

class extract(Command):
    def execute(self):
        """ extract selected files to current directory."""
        cwd = self.fm.thisdir
        marked_files = tuple(cwd.get_selection())

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = marked_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ['-x', cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ['-e']

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(marked_files) == 1:
            descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(
                one_file.dirname)
        obj = CommandLoader(args=['aunpack'] + au_flags
                            + [f.path for f in marked_files], descr=descr,
                            read=True)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

class compress(Command):
    def execute(self):
        """ Compress marked files to current directory """
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(args=['apack'] + au_flags +
                            [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr, read=True)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

    def tab(self, tabnum):
        """ Complete with current folder name """

        extension = ['.zip', '.tar.gz', '.rar', '.7z']
        return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]


class bulkrename(Command):
    """:bulkrename

    This command opens a list of selected files in an external editor.
    After you edit and save the file, it will generate a shell script
    which does bulk renaming according to the changes you did in the file.

    This shell script is opened in an editor for you to review.
    After you close it, it will be executed.
    """

    def execute(self):
        # pylint: disable=too-many-locals,too-many-statements,too-many-branches
        self.fm.run("brn")
        # import sys
        # import tempfile
        # from ranger.container.file import File
        # from ranger.ext.shell_escape import shell_escape as esc
        # py3 = sys.version_info[0] >= 3
        #
        # # Create and edit the file list
        # filenames = [f.relative_path for f in self.fm.thistab.get_selection()]
        # with tempfile.NamedTemporaryFile(delete=False) as listfile:
        #     listpath = listfile.name
        #     if py3:
        #         listfile.write("\n".join(filenames).encode(
        #             encoding="utf-8", errors="surrogateescape"))
        #     else:
        #         listfile.write("\n".join(filenames))
        # self.fm.execute_file([File(listpath)], app='editor')
        # with (open(listpath, 'r', encoding="utf-8", errors="surrogateescape") if
        #       py3 else open(listpath, 'r')) as listfile:
        #     new_filenames = listfile.read().split("\n")
        # os.unlink(listpath)
        # if all(a == b for a, b in zip(filenames, new_filenames)):
        #     self.fm.notify("No renaming to be done!")
        #     return
        #
        # # Generate script
        # with tempfile.NamedTemporaryFile() as cmdfile:
        #     script_lines = []
        #     script_lines.append("# This file will be executed when you close"
        #                         " the editor.")
        #     script_lines.append("# Please double-check everything, clear the"
        #                         " file to abort.")
        #     new_dirs = []
        #     for old, new in zip(filenames, new_filenames):
        #         if old != new:
        #             basepath, _ = os.path.split(new)
        #             if (basepath and basepath not in new_dirs
        #                     and not os.path.isdir(basepath)):
        #                 script_lines.append("mkdir -vp -- {dir}".format(
        #                     dir=esc(basepath)))
        #                 new_dirs.append(basepath)
        #             script_lines.append("mv -vi -- {old} {new}".format(
        #                 old=esc(old), new=esc(new)))
        #     # Make sure not to forget the ending newline
        #     script_content = "\n".join(script_lines) + "\n"
        #     if py3:
        #         cmdfile.write(script_content.encode(encoding="utf-8",
        #                                             errors="surrogateescape"))
        #     else:
        #         cmdfile.write(script_content)
        #     cmdfile.flush()
        #
        #     # Open the script and let the user review it, then check if the
        #     # script was modified by the user
        #     self.fm.execute_file([File(cmdfile.name)], app='editor')
        #     cmdfile.seek(0)
        #     script_was_edited = (script_content != cmdfile.read())
        #
        #     # Do the renaming
        #     self.fm.run(['/bin/sh', cmdfile.name], flags='w')
        #
        # # Retag the files, but only if the script wasn't changed during review,
        # # because only then we know which are the source and destination files.
        # if not script_was_edited:
        #     tags_changed = False
        #     for old, new in zip(filenames, new_filenames):
        #         if old != new:
        #             oldpath = self.fm.thisdir.path + '/' + old
        #             newpath = self.fm.thisdir.path + '/' + new
        #             if oldpath in self.fm.tags:
        #                 old_tag = self.fm.tags.tags[oldpath]
        #                 self.fm.tags.remove(oldpath)
        #                 self.fm.tags.tags[newpath] = old_tag
        #                 tags_changed = True
        #     if tags_changed:
        #         self.fm.tags.dump()
        # else:
        #     fm.notify("files have not been retagged")

