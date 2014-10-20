#!/usr/bin/python
# Converts Edward_Ross.tex to pandoc syntax (printed to stdout)
# for further conversion to word or HTML.
# Is fragile with syntax of Edward_Ross.tex, but flexible with content.
import re, sys

texArgument = '{([^}]*)}'
def getTex(name, numArgs):
  return re.compile(r'\\' + name + texArgument * numArgs)

def extractParameter(name, s):
  pattern = getTex(name, 1)
  return pattern.search(s).group(1)

head = getTex('head', 1)
startExp = getTex('startExp', 3)
exp = getTex('exp', 1)
description = getTex('description', 1)
skill = getTex('skill', 1) 
#Very simple macros; practical if not correct
macro = re.compile('\\\\[a-zA-Z]+[^\s]*')
comment = re.compile('%[^\n]*')

excessNewlines = re.compile('(\n\s*)+\n(\s*)')

fin = open("Edward_Ross.tex", 'r');
txt = fin.read();

name = extractParameter('name', txt)
phone = extractParameter('phone', txt)
email = extractParameter('email', txt)

prelude = name + '\n==========\n\n*' + phone + '*\n\n*' + email + '*\n\n'

#Cut off the preamble
start = txt.find('%%BEGIN');
txt = txt[start:] 

#Convert to Markdown
txt = head.sub('## \\1', txt)
txt = startExp.sub("### \\1 -- \\3\n#### \\2", txt)
txt = description.sub("\n\\1", txt)
txt = exp.sub('  * \\1', txt)
txt = skill.sub('### \\1', txt)

#Strip comments and remaining macros
txt = comment.sub('',txt)
txt = macro.sub('',txt)
#Prettify the file; keep double newlines for markdown
txt = excessNewlines.sub('\n\n\\2',txt);

print(prelude + txt);


