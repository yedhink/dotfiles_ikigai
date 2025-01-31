import ranger.api
from ranger.api.commands import *
from subprocess import check_output
from os import getenv


class z(Command):
    """:z
    Uses .z file to set the current directory.
    """

    def execute(self):
        # location of rupa z source file
        z_loc = getenv("_Z_SRC")
        try:
            arguments = 'source {} && _z -e {}'.format(
                z_loc, " ".join(self.args[1:]))
            cmd = ['zsh', '-c', arguments]
            directory = check_output(cmd).decode("utf-8").rstrip("\n")
            self.fm.execute_console("cd " + directory)
        except Exception as e:
            raise Exception("Directory not found")
