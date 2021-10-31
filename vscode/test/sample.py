from typing import List

@decorator(param=1)
def f(x):
    """ Syntax Highlighting Demo
        @param x Parameter

        Semantic highlighting:
        Generated spectrum to pick colors for local variables and parameters:
         Color#1 SC1.1 SC1.2 SC1.3 SC1.4 Color#2 SC2.1 SC2.2 SC2.3 SC2.4 Color#3
         Color#3 SC3.1 SC3.2 SC3.3 SC3.4 Color#4 SC4.1 SC4.2 SC4.3 SC4.4 Color#5
    """
    s = ("Test", 2+3, {'a': 'b'}, f'{x!s:{"^10"}}') # Comment
    f(s[0].lower())

class Foo:
    tags: List[str]
    def __init__(self: Foo):
        byte_string: bytes = b'newline:\n also newline:\x0a'
        text_string = u"Cyrillic Я is \u042f. Oops: \u042g"
        self.makeSense(whatever=1)
    
    def makeSense(self, whatever):
        self.sense = whatever

x = len('abc')
print(f.__doc__)


def test(_1: str, _2: int, _3: float) -> str:
    """
    :param inp: input
    """
    """This Multi-line string is yellow in PyCharm but Green in VSCode!"""
    print(_1) # Proviing python plugin has NO semantic highlight


x = lambda a : a + 10
print(x(5))

mytuple = ("apple", "banana", "cherry")
myit = iter(mytuple)

print(next(myit))
print(next(myit))
print(next(myit))

friends = ['john', 'pat', 'gary', 'michael']
for i, name in enumerate(friends):
    print ("iteration {iteration} is {name}".format(iteration=i, name=name))


from typing import Sequence, TypeVar

T = TypeVar('T')      # Declare type variable

def first(l: Sequence[T]) -> T:   # Generic function
    return l[0]

#!/usr/bin/env python
#
# usage: fontforge -lang=py ligaturize.py <input file> <output file> [ligature file]
#
# It will copy input to output, updating the embedded font name and splicing
# in the ligatures from FiraCode-Medium.otf (which must be in $PWD). If the
# ligature file is not specified, it will try to guess an appropriate Fira Code
# OTF based on the name of the output file.
#
# See ligatures.py for a list of all the ligatures that will be copied.
import sys
import fontforge
import psMat
from os import path
from ligatures import ligatures
from char_mapping import char_dict


def get_copyright(liga_font_family_name):
    switcher = {
        'fira code': 'Programming ligatures added by gaplo917 from FiraCode. Copyright (c) 2015 by Nikita Prokopov',
        'jetbrains mono': 'Programming ligatures added by gaplo917 from JetBrains Mono. Copyright (c) 2020 by JetBrains',
    }
    return switcher.get(liga_font_family_name.lower())

class Student(str):
  def __init__(self, fname, lname, year):
    super().__init__(fname, lname)
    self.graduationyear = year

  def welcome(self):
    print("Welcome", self.firstname, self.lastname, "to the class of", self.graduationyear)


class LigatureCreator(object):

    def __init__(self, font, liga_font,
                 scale_character_glyphs_threshold,
                 scale_ligature_threshold,
                 copy_character_glyphs):
        self.font = font
        self.liga_font = liga_font
        self.scale_character_glyphs_threshold = scale_character_glyphs_threshold
        self.scale_ligature_threshold = scale_ligature_threshold
        self.should_copy_character_glyphs = copy_character_glyphs
        self._lig_counter = 0

        # Scale ligature font to correct em height.
        self.liga_font.em = self.font.em
        self.emwidth = self.font[ord('m')].width

    def copy_ligature_from_source(self, ligature_name):
        try:
            self.liga_font.selection.none()
            self.liga_font.selection.select(ligature_name)
            self.liga_font.copy()
            return True
        except ValueError:
            return False

    def correct_character_width(self, glyph):
        """Width-correct copied individual characters (not ligatures!).

        This will correct the horizontal advance of characters to match the em
        width of the output font, and (depending on the width of the glyph, the
        em width of the output font, and the value of the command line option
        --scale-character-glyphs-threshold) optionally horizontally scale it.

        Glyphs that are not horizontally scaled, but which still need horizontal
        advance correction, will be centered instead.
        """

        if glyph.width == self.emwidth:
            # No correction needed.
            return

        width_delta = float(abs(glyph.width - self.emwidth)) / self.emwidth
        if width_delta >= self.scale_character_glyphs_threshold:
            # Character is too wide/narrow compared to output font; scale it.
            scale = float(self.emwidth) / glyph.width
            glyph.transform(psMat.scale(scale, 1.0))
        else:
            # Do not scale; just center copied characters in their hbox.
            # Fix horizontal advance first, to recalculate the bearings.
            glyph.width = self.emwidth
            # Correct bearings to center the glyph.
            glyph.left_side_bearing = (glyph.left_side_bearing + glyph.right_side_bearing) / 2
            glyph.right_side_bearing = glyph.left_side_bearing

        # Final adjustment of horizontal advance to correct for rounding
        # errors when scaling/centering -- otherwise small errors can result
        # in visible misalignment near the end of long lines.
        glyph.width = self.emwidth

    def copy_character_glyphs(self, chars):
        """Copy individual (non-ligature) characters from the ligature font."""
        if not self.should_copy_character_glyphs:
            return
        print("    ...copying %d character glyphs..." % (len(chars)))

        for char in chars:
            self.liga_font.selection.none()
            self.liga_font.selection.select(char)
            self.liga_font.copy()
            self.font.selection.none()
            self.font.selection.select(char)
            self.font.paste()
            self.correct_character_width(self.font[ord(char_dict[char])])

    def correct_ligature_width(self, glyph):
        """Correct the horizontal advance and scale of a ligature."""

        if glyph.width == self.emwidth:
            return

        width_delta = float(abs(glyph.width - self.emwidth)) / self.emwidth
        if width_delta >= self.scale_ligature_threshold:
            scale = float(self.emwidth) / glyph.width
            glyph.transform(psMat.scale(scale, 1.0))
            glyph.width = self.emwidth
        else:
            scale = float(self.emwidth) / glyph.width
            glyph.width = self.emwidth
            glyph.left_side_bearing *= scale
            glyph.right_side_bearing *= scale

        glyph.width = self.emwidth

    def add_ligature(self, input_chars, ligature_name):
        if ligature_name is None:
            # No ligature name -- we're just copying a bunch of individual characters.
            self.copy_character_glyphs(input_chars)
            return

        if not self.copy_ligature_from_source(ligature_name):
            # Ligature not in source font.
            return

        self._lig_counter += 1
        ligature_name = 'lig.{}'.format(self._lig_counter)

        self.font.createChar(-1, ligature_name)
        self.font.selection.none()
        self.font.selection.select(ligature_name)
        self.font.paste()
        self.correct_ligature_width(self.font[ligature_name])

        self.font.selection.none()
        self.font.selection.select('space')
        self.font.copy()

        def lookup_name(i):
            return 'lookup.{}.{}'.format(self._lig_counter, i)

        def lookup_sub_name(i):
            return 'lookup.sub.{}.{}'.format(self._lig_counter, i)

        def cr_name(i):
            return 'CR.{}.{}'.format(self._lig_counter, i)

        for i, char in enumerate(input_chars):
            self.font.addLookup(lookup_name(i), 'gsub_single', (), ())
            self.font.addLookupSubtable(lookup_name(i), lookup_sub_name(i))

            if char not in self.font:
                # We assume here that this is because char is a single letter
                # (e.g. 'w') rather than a character name, and the font we're
                # editing doesn't have glyphnames for letters.
                self.font[ord(char_dict[char])].glyphname = char

            if i < len(input_chars) - 1:
                self.font.createChar(-1, cr_name(i))
                self.font.selection.none()
                self.font.selection.select(cr_name(i))
                self.font.paste()

                self.font[char].addPosSub(lookup_sub_name(i), cr_name(i))
            else:
                self.font[char].addPosSub(lookup_sub_name(i), ligature_name)

        calt_lookup_name = 'calt.{}'.format(self._lig_counter)
        self.font.addLookup(calt_lookup_name, 'gsub_contextchain', (),
            (('calt', (('DFLT', ('dflt',)),
                       ('arab', ('dflt',)),
                       ('armn', ('dflt',)),
                       ('cyrl', ('SRB ', 'dflt')),
                       ('geor', ('dflt',)),
                       ('grek', ('dflt',)),
                       ('lao ', ('dflt',)),
                       ('latn', ('CAT ', 'ESP ', 'GAL ', 'ISM ', 'KSM ', 'LSM ', 'MOL ', 'NSM ', 'ROM ', 'SKS ', 'SSM ', 'dflt')),
                       ('math', ('dflt',)),
                       ('thai', ('dflt',)))),))
        # print('CALT %s (%s)' % (calt_lookup_name, ligature_name))
        for j, char in enumerate(input_chars):
            self.add_calt(
                calt_lookup_name,
                'calt.{}.{}'.format(self._lig_counter, j),
                '{prev} | {cur} @<{lookup}> | {next}',
                prev=' '.join(cr_name(j) for j in range(j)),
                cur=char,
                lookup=lookup_name(j),
                next=' '.join(input_chars[j+1:]))

        # Add ignore rules
        self.add_calt(
            calt_lookup_name,
            'calt.{}.{}'.format(self._lig_counter, i + 1),
            '| {first} | {rest} {last}',
            first=input_chars[0],
            rest=' '.join(input_chars[1:]),
            last=input_chars[-1])
        self.add_calt(
            calt_lookup_name,
            'calt.{}.{}'.format(self._lig_counter, i + 2),
            '{first} | {first} | {rest}',
            first=input_chars[0],
            rest=' '.join(input_chars[1:]))

    def add_calt(self, calt_name, subtable_name, spec, **kwargs):
        spec = spec.format(**kwargs)
        # print('    %s: %s ' % (subtable_name, spec))
        self.font.addContextualSubtable(calt_name, subtable_name, 'glyph', spec)


def replace_sfnt(font, key, value):
    font.sfnt_names = tuple(
        (row[0], key, value)
        if row[1] == key
        else row
        for row in font.sfnt_names
    )


def update_font_metadata(font, new_name, font_copyright):
    # Figure out the input font's real name (i.e. without a hyphenated suffix)
    # and hyphenated suffix (if present)
    old_name = font.familyname
    try:
        suffix = font.fontname.split('-')[1]
    except IndexError:
        suffix = None

    # Replace the old name with the new name whether or not a suffix was present.
    # If a suffix was present, append it accordingly.
    font.familyname = new_name
    if suffix:
        font.fullname = "%s %s" % (new_name, suffix)
        font.fontname = "%s-%s" % (new_name.replace(' ', ''), suffix)
    else:
        font.fullname = new_name
        font.fontname = new_name.replace(' ', '')

    print("Ligaturizing font %s (%s) as '%s'" % (
        path.basename(font.path), old_name, new_name))

    font.copyright += font_copyright
    replace_sfnt(font, 'UniqueID', '%s; Ligaturized' % font.fullname)
    replace_sfnt(font, 'Preferred Family', new_name)
    replace_sfnt(font, 'Compatible Full', new_name)
    replace_sfnt(font, 'WWS Family', new_name)


def ligaturize_font(input_font_file, output_dir, ligature_font_file,
                    output_name, suffix, **kwargs):
    font = fontforge.open(input_font_file)

    if not ligature_font_file:
        print('Error: missing specify the ligature font')
        sys.exit(1)

    if output_name:
        name = output_name
    else:
        name = font.familyname
    if suffix:
        name = "%s %s" % (name, suffix)

    print('    ...using ligatures from %s' % ligature_font_file)
    liga_font = fontforge.open(ligature_font_file)

    update_font_metadata(font, name, get_copyright(liga_font.familyname))

    creator = LigatureCreator(font, liga_font, **kwargs)

    def ligature_length(lig):
        return len(lig['chars'])

    for lig_spec in sorted(ligatures, key = ligature_length):
        try:
            creator.add_ligature(lig_spec['chars'], lig_spec['ligature_name'])
        except Exception as e:
            print('Exception while adding ligature: {}'.format(lig_spec))
            raise

    # Work around a bug in Fontforge where the underline height is subtracted from
    # the underline width when you call generate().
    font.upos += font.uwidth

    # Generate font type (TTF or OTF) corresponding to input font extension
    # (defaults to TTF)
    if input_font_file[-4:].lower() == '.otf':
        output_font_type = '.otf'
    else:
        output_font_type = '.ttf'

    # Generate font & move to output directory
    output_font_file = path.join(output_dir, font.fontname + output_font_type)
    print("    ...saving to '%s' (%s)" % (output_font_file, font.fullname))
    font.generate(output_font_file)
    font.close()
    liga_font.close()
