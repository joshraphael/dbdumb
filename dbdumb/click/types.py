import click
import re

class Format(click.ParamType):
    name = 'format'

    def convert(self, value, param, ctx):
        found = re.match(r'(json|yaml)', value)

        if not found:
            self.fail(f'{value} is not a valid format', param, ctx)
        return value