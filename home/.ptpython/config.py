from __future__ import unicode_literals
from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.key_binding.input_processor import KeyPress
from prompt_toolkit.keys import Keys
from pygments.token import Token

from ptpython.layout import CompletionVisualisation

__all__ = (
    'configure',
)

def configure(repl):
    repl.vi_mode = True

    @repl.add_key_binding('j', 'k', filter=ViInsertMode())
    def _(event):
        " Map 'jk' to Escape. "
        event.cli.input_processor.feed(KeyPress(Keys.Escape))
