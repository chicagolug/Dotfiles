<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: column-marker.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=column-marker.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: column-marker.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=column-marker.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for column-marker.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=column-marker.el" /><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<br /><span class="specialdays">Bhutan, National Day</span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22column-marker.el%22">column-marker.el</a></h1></div><div class="wrapper"><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/column-marker.el">Download</a></p><pre class="code"><span class="linecomment">;;; column-marker.el --- Highlight certain character columns</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Filename: column-marker.el</span>
<span class="linecomment">;; Description: Highlight certain character columns</span>
<span class="linecomment">;; Author: Rick Bielawski &lt;rbielaws@i1.net&gt;</span>
<span class="linecomment">;; Maintainer: Rick Bielawski &lt;rbielaws@i1.net&gt;</span>
<span class="linecomment">;; Created: Tue Nov 22 10:26:03 2005</span>
<span class="linecomment">;; Version: 9</span>
<span class="linecomment">;; Last-Updated: Fri Jan 22 11:28:48 2010 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 312</span>
<span class="linecomment">;; Keywords: tools convenience highlight</span>
<span class="linecomment">;; Compatibility: GNU Emacs 21, GNU Emacs 22, GNU Emacs 23</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   None</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Commentary: </span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Highlights the background at a given character column.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Commands `column-marker-1', `column-marker-2', and</span>
<span class="linecomment">;; `column-marker-3' each highlight a given column (using different</span>
<span class="linecomment">;; background colors, by default).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; - With no prefix argument, each highlights the current column</span>
<span class="linecomment">;;   (where the cursor is).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; - With a non-negative numeric prefix argument, each highlights that</span>
<span class="linecomment">;;   column.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; - With plain `C-u' (no number), each turns off its highlighting.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; - With `C-u C-u', each turns off all column highlighting.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; If two commands highlight the same column, the last-issued</span>
<span class="linecomment">;; highlighting command shadows the other - only the last-issued</span>
<span class="linecomment">;; highlighting is seen.  If that "topmost" highlighting is then</span>
<span class="linecomment">;; turned off, the other highlighting for that column then shows</span>
<span class="linecomment">;; through.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Examples:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; M-x column-marker-1 highlights the column where the cursor is, in</span>
<span class="linecomment">;; face `column-marker-1'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; C-u 70 M-x column-marker-2 highlights column 70 in face</span>
<span class="linecomment">;; `column-marker-2'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; C-u 70 M-x column-marker-3 highlights column 70 in face</span>
<span class="linecomment">;; `column-marker-3'.  The face `column-marker-2' highlighting no</span>
<span class="linecomment">;; longer shows.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; C-u M-x column-marker-3 turns off highlighting for column-marker-3,</span>
<span class="linecomment">;; so face `column-marker-2' highlighting shows again for column 70.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; C-u C-u M-x column-marker-1 (or -2 or -3) erases all column</span>
<span class="linecomment">;; highlighting.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; These commands use `font-lock-fontify-buffer', so syntax</span>
<span class="linecomment">;; highlighting (`font-lock-mode') must be turned on.  There might be</span>
<span class="linecomment">;; a performance impact during refontification.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Installation: Place this file on your load path, and put this in</span>
<span class="linecomment">;; your init file (`.emacs'):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; (require 'column-marker)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Other init file suggestions (examples):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; ;; Highlight column 80 in foo mode.</span>
<span class="linecomment">;; (add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; ;; Use `C-c m' interactively to highlight with face `column-marker-1'.</span>
<span class="linecomment">;; (global-set-key [?\C-c ?m] 'column-marker-1)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Please report any bugs!</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2009/12/10 dadams</span>
<span class="linecomment">;;     column-marker-internal: Quote the face.  Thx to Johan Bockgård.</span>
<span class="linecomment">;; 2009/12/09 dadams</span>
<span class="linecomment">;;     column-marker-find: fset a symbol to the function, and return the symbol.</span>
<span class="linecomment">;; 2008/01/21 dadams</span>
<span class="linecomment">;;     Renamed faces by dropping suffix "-face".</span>
<span class="linecomment">;; 2006/08/18 dadams</span>
<span class="linecomment">;;     column-marker-create: Add newlines to doc-string sentences.</span>
<span class="linecomment">;; 2005/12/31 dadams</span>
<span class="linecomment">;;     column-marker-create: Add marker to column-marker-vars inside the defun,</span>
<span class="linecomment">;;       so it is done in the right buffer, updating column-marker-vars buffer-locally.</span>
<span class="linecomment">;;     column-marker-find: Corrected comment.  Changed or to progn for clarity.</span>
<span class="linecomment">;; 2005/12/29 dadams</span>
<span class="linecomment">;;     Updated wrt new version of column-marker.el (multi-column characters).</span>
<span class="linecomment">;;     Corrected stray occurrences of column-marker-here to column-marker-1.</span>
<span class="linecomment">;;     column-marker-vars: Added make-local-variable.</span>
<span class="linecomment">;;     column-marker-create: Changed positive to non-negative.</span>
<span class="linecomment">;;     column-marker-internal: Turn off marker when col is negative, not &lt; 1.</span>
<span class="linecomment">;; 2005-12-29 RGB</span>
<span class="linecomment">;;     column-marker.el now supports multi-column characters.</span>
<span class="linecomment">;; 2005/11/21 dadams</span>
<span class="linecomment">;;     Combined static and dynamic. </span>
<span class="linecomment">;;     Use separate faces for each marker.  Different interactive spec.</span>
<span class="linecomment">;; 2005/10/19 RGB</span>
<span class="linecomment">;;     Initial release of column-marker.el.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Code:</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;</span>


(defface column-marker-1 '((t (:background "<span class="quote">gray</span>")))
  "<span class="quote">Face used for a column marker.  Usually a background color.</span>"
  :group 'faces)

(defvar column-marker-1-face 'column-marker-1
    "<span class="quote">Face used for a column marker.  Usually a background color.
Changing this directly affects only new markers.</span>")

(defface column-marker-2 '((t (:background "<span class="quote">cyan3</span>")))
  "<span class="quote">Face used for a column marker.  Usually a background color.</span>"
  :group 'faces)

(defvar column-marker-2-face 'column-marker-2
    "<span class="quote">Face used for a column marker.  Usually a background color.
Changing this directly affects only new markers.</span>" )

(defface column-marker-3 '((t (:background "<span class="quote">orchid3</span>")))
  "<span class="quote">Face used for a column marker.  Usually a background color.</span>"
  :group 'faces)

(defvar column-marker-3-face 'column-marker-3
    "<span class="quote">Face used for a column marker.  Usually a background color.
Changing this directly affects only new markers.</span>" )

(defvar column-marker-vars ()
  "<span class="quote">List of all internal column-marker variables</span>")
(make-variable-buffer-local 'column-marker-vars) <span class="linecomment">; Buffer local in all buffers.</span>

(defmacro column-marker-create (var &optional face)
  "<span class="quote">Define a column marker named VAR.
FACE is the face to use.  If nil, then face `column-marker-1' is used.</span>"
  (setq face (or face 'column-marker-1))
  `(progn
     <span class="linecomment">;; define context variable ,VAR so marker can be removed if desired</span>
     (defvar ,var ()
       "<span class="quote">Buffer local. Used internally to store column marker spec.</span>")
     <span class="linecomment">;; context must be buffer local since font-lock is </span>
     (make-variable-buffer-local ',var)
     <span class="linecomment">;; Define wrapper function named ,VAR to call `column-marker-internal'</span>
     (defun ,var (arg)
       ,(concat "<span class="quote">Highlight column with face `</span>" (symbol-name face)
                "<span class="quote">'.\nWith no prefix argument, highlight current column.\n</span>"
                "<span class="quote">With non-negative numeric prefix arg, highlight that column number.\n</span>"
                "<span class="quote">With plain `C-u' (no number), turn off this column marker.\n</span>"
                "<span class="quote">With `C-u C-u' or negative prefix arg, turn off all column-marker highlighting.</span>")
       (interactive "<span class="quote">P</span>")
       (unless (memq ',var column-marker-vars) (push ',var column-marker-vars))
       (cond ((null arg)          <span class="linecomment">; Default: highlight current column.</span>
              (column-marker-internal ',var (1+ (current-column)) ,face))
             ((consp arg)
              (if (= 4 (car arg))
                  (column-marker-internal ',var nil) <span class="linecomment">; `C-u': Remove this column highlighting.</span>
                (dolist (var column-marker-vars)
                  (column-marker-internal var nil)))) <span class="linecomment">; `C-u C-u': Remove all column highlighting.</span>
             ((and (integerp arg) (&gt;= arg 0)) <span class="linecomment">; `C-u 70': Highlight that column.</span>
              (column-marker-internal ',var (1+ (prefix-numeric-value arg)) ,face))
             (t           <span class="linecomment">; `C-u -40': Remove all column highlighting.</span>
              (dolist (var column-marker-vars)
                (column-marker-internal var nil)))))))

(defun column-marker-find (col)
  "<span class="quote">Defines a function to locate a character in column COL.
Returns the function symbol, named `column-marker-move-to-COL'.</span>"
  (let ((fn-symb  (intern (format "<span class="quote">column-marker-move-to-%d</span>" col))))
    (fset `,fn-symb
          `(lambda (end)
             (let ((start (point)))
               (when (&gt; end (point-max)) (setq end (point-max)))

               <span class="linecomment">;; Try to keep `move-to-column' from going backward, though it still can.</span>
               (unless (&lt; (current-column) ,col) (forward-line 1))

               <span class="linecomment">;; Again, don't go backward.  Try to move to correct column.</span>
               (when (&lt; (current-column) ,col) (move-to-column ,col))

               <span class="linecomment">;; If not at target column, try to move to it.</span>
               (while (and (&lt; (current-column) ,col) (&lt; (point) end)
                           (= 0 (+ (forward-line 1) (current-column)))) <span class="linecomment">; Should be bol.</span>
                 (move-to-column ,col))

               <span class="linecomment">;; If at target column, not past end, and not prior to start,</span>
               <span class="linecomment">;; then set match data and return t.  Otherwise go to start</span>
               <span class="linecomment">;; and return nil.</span>
               (if (and (= ,col (current-column)) (&lt;= (point) end) (&gt; (point) start))
                   (progn (set-match-data (list (1- (point)) (point)))
                          t)            <span class="linecomment">; Return t.</span>
                 (goto-char start)
                 nil))))                <span class="linecomment">; Return nil.</span>
    fn-symb))

(defun column-marker-internal (sym col &optional face)
  "<span class="quote">SYM is the symbol for holding the column marker context.
COL is the column in which a marker should be set.
Supplying nil or 0 for COL turns off the marker.
FACE is the face to use.  If nil, then face `column-marker-1' is used.</span>"
  (setq face (or face 'column-marker-1))
  (when (symbol-value sym)   <span class="linecomment">; Remove any previously set column marker</span>
    (font-lock-remove-keywords nil (symbol-value sym))
    (set sym nil))
  (when (or (listp col) (&lt; col 0)) (setq col nil)) <span class="linecomment">; Allow nonsense stuff to turn off the marker</span>
  (when col                             <span class="linecomment">; Generate a new column marker</span>
    (set sym `((,(column-marker-find col) (0 ',face prepend t))))
    (font-lock-add-keywords nil (symbol-value sym) t))
  (font-lock-fontify-buffer))

<span class="linecomment">;; If you need more markers you can create your own similarly.</span>
<span class="linecomment">;; All markers can be in use at once, and each is buffer-local,</span>
<span class="linecomment">;; so there is no good reason to define more unless you need more</span>
<span class="linecomment">;; markers in a single buffer.</span>
(column-marker-create column-marker-1 column-marker-1-face)
(column-marker-create column-marker-2 column-marker-2-face)
(column-marker-create column-marker-3 column-marker-3-face)

<span class="linecomment">;;;###autoload</span>
(autoload 'column-marker-1 "<span class="quote">column-marker</span>" "<span class="quote">Highlight a column.</span>" t)

<span class="linecomment">;;;;;;;;;;;;;;;;;;</span>

(provide 'column-marker)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; column-marker.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=column-marker.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_column-marker.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=column-marker.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=column-marker.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=column-marker.el">Administration</a></span><!-- test --><span class="time"><br /> Last edited 2012-11-28 08:43 UTC by <a class="author" title="from london.languagelab.com" href="http://www.emacswiki.org/emacs/RyanKaskel">RyanKaskel</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=column-marker.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
