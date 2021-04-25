\version "2.22.0"

\header {
  title =  "I Can't Help Falling in Love With You"
  subtitle =  "For A Capella Trio (SAT)"
}

\layout {
  \context {
    \Score
  }
}

global = { \numericTimeSignature\time 4/4 \key c \major }

sopranonotesVerse = \relative e' {
   e2  dis2 | % 18
   g2  fis2 | % 19
   e2  dis2 | % 20
   e1 | % 21
   c2  d2
}

sopranonotes =  \relative e' {
  \clef "treble" \mark \markup{ \bold {Adagio} } | % 1
   R1*8 | % 8
   e2  g2 | % 10
   e2. r4 | % 11
   a2  g2 | % 12
   g2. r4 | % 13
   c,2  d2 | % 14
   e2 \times 2/3 {
     f4  g4  a4
  }
  | % 15
   g2  f2 | % 16
   e1 | % 17
   \sopranonotesVerse | \break % 22
   e2.  g4 ~ | % 23
   g4  e2  f8 [  e8 ] | % 24
   r4  a2  g4~ | % 25
   g4 ( e4 d2 ) | % 26
   c2  d2 | % 27
   e4 (  d2. ) | % 28
   g2  g2 | % 29
   e1 | \pageBreak % 30
   \sopranonotesVerse | \break % 35
   e2  g2 | % 36
   e2. r4 | % 37
   a2  g2 | % 38
   g2. r4 | % 39
   c,2  d2 | % 40
   e2 \times 2/3 {
     f4  g4  a4
  }
  | % 41
   g2  f2 | % 42
   e2. r4 | % 43
  R1*2 | % 45
  r2  <f g>2 ( ^\fermata | % 46
  <e g>1 ) ^\fermata \bar "|."
}

sopranowords =  \lyricmode {
  \set ignoreMelismata = ##t
  Shall I "stay?" be a "sin?" I "can't" help fal -- ling in love with
  "you." Ah -- ah ah -- ah ah -- ah ah ah -- ah Take my\skip1 hand
  take my whole life too\skip1 \skip1 I "can't" he -- lp love with
  "you." Ah -- ah ah -- ah ah -- ah ah ah -- ah dmm -- mm dmm dmm --
  mm dmm dmm -- mm dmm dmm dmm dmm dmm dmm dmm\skip1 \skip1
}

altonotesVerse = \relative c' {
  b1 | % 18
   e2  dis2 | % 19
  b1 | % 20
  c1 | % 21
   a2  b2 | % 22
}

altonotesChorus = \relative c' {
   c2
   \tag #'secondIntroChorus { e2 }
   \tag #'normalChorus { g2 } | % 23
   c,2.  d8  e8 | % 24
   f2  e2 | % 25
   d2. r8  g,8 | % 26
   a2  b2 | % 27
   c2 \times 2/3 {
     d4  e4  f4
  }
  | % 28
   e2  d2 | % 29
}


altonotes =  \relative c' {
  \clef "treble" | % 1
  \removeWithTag #'secondIntroChorus \altonotesChorus |
  c1 | \break % 9
  \removeWithTag #'normalChorus \altonotesChorus |
  c1 | % 17
  \altonotesVerse |
  \removeWithTag #'secondIntroChorus \altonotesChorus |
  c1 | % 30
  \altonotesVerse |
    \removeWithTag #'secondIntroChorus \altonotesChorus |
  c2. r8  g8 | % 43
   a2  b2 | % 44
   c2 \times 2/3 {
     d4  e4  f4
  }
  | % 45
   e2  d2 ^\fermata | % 46
  c1 ^\fermata \bar "|."
}

altowordsChorus = \lyricmode {
Take my "hand," take my whole life too for I "can't" help fal -- ling in
  love with "you."}

altowords =  \lyricmode {
  \set ignoreMelismata = ##t Wise
  men say on -- ly fools rush in but I "can't" help fal -- ling in
  love with "you." Shall I "stay?" Would it be a "sin?" If I "can't"
  help fal -- ling in love with "you." Ah ah -- ah ah ah ah -- ah 
  \altowordsChorus
  Ah ah -- ah ah ah ah -- ah \altowordsChorus
  for I "can't" help fal -- ling in love with "you."
}

tenornotesVerse = \relative c {
   b8. [  e8.  g16  b16~ ]  b16 (
   a4.. ) | % 18
   b,8. [  e8.  g16  b16~ ]  b16 (
   a4.. ) | % 19
   b,8. [  e8.  g16  b16~ ]  b16 (
   a4.. ) | %20
   g8.  g4..  e8 [  g8  e8 ] | % 21
   f2 (  g2 ) | % 22
}

tenornotes =  \relative c' {
  \clef "treble_8" | % 1
  R1*8 | % 9
   c2  b2 | % 10
   a2. r4 | % 11
   c2  c2 | % 12
   b2. r8  g8 | % 13
   f2  g2 | % 14
  a1 | % 15
   c2  g2 | % 16
  c,1 | % 17
   \tenornotesVerse |
   c'2  b2 | % 23
   a4 (  g4 f4 g4 ) | % 24
   c2  c2 | % 25
   b2. r8  g8 | % 26
   f4 (  e4 )  d4 (  g4 ) | % 27
   g4 (  a2. ) | % 28
   c2  b2 | % 29
  c1 | % 30
   \tenornotesVerse |
   c2  b2 | % 36
   a2. r4 | % 37
   c2  c2 | % 38
   b2. r4 | % 39
   f2  g2 | % 40
  a1 | % 41
   c2  g2 | % 42
   c,2. r4 | % 43
  R1 | % 44
  r2 \times 2/3 {
     d4  e4  f4
  }
  | % 45
   e2  d2 ^\fermata | % 46
  c1 ^\fermata \bar "|."
}

tenorwordsVerse = \lyricmode {
Like a riv -- er flo -- ws sure -- ly to the se -- a dar -- ling so it go
  -- es some things are meant to be -- e }

tenorwords =  \lyricmode {
  \set ignoreMelismata = ##t
  Shall I "stay?" be a "sin?" if I "can't" help love with "you." 
  \tenorwordsVerse Take my ha -- a -- a -- and
  whole life too for I\skip1 ca -- "n't" help\skip1 love with "you."
  \tenorwordsVerse dmm -- mm dmm dmm --
  mm -- dmm dmm -- mm dmm dmm -- mm -- dmm\skip1 \skip1 \skip1 \skip1
  \skip1 \skip1
}

bassnotes = {}
basswords = {}

% The score definition
gigaStaff = {
  \new ChoirStaff \with {midiInstrument = #"choir aahs"} <<
    \new Staff <<
      \set Staff.instrumentName = "Soprano"
      \set Staff.shortInstrumentName = "S."
      \new Voice = "soprano" <<
        \global
        \sopranonotes
        \context Lyrics = "soprano" \lyricsto "soprano" \sopranowords
      >>
    >>
    \new Staff <<
      \set Staff.instrumentName = "Alto"
      \set Staff.shortInstrumentName = "A."
      \new Voice = "alto" <<
        \global
        \altonotes
        \context Lyrics = "alto" \lyricsto "alto" \altowords
      >>
    >>
    \new Staff <<
      \set Staff.instrumentName = "Tenor"
      \set Staff.shortInstrumentName = "T."
      \new Voice = "tenor" <<
        \global
        \tenornotes
        \context Lyrics = "tenor" \lyricsto "tenor" \tenorwords
      >>
    >>
    \new Staff  <<
      \set Staff.instrumentName = "Bass"
      \set Staff.shortInstrumentName = "B."
      \new Voice = "bass" <<
        \global
        \bassnotes
        \context Lyrics = "bass" \lyricsto "bass" \basswords
      >>
    >>
  >>
}

\score {
  \gigaStaff
  \layout {
   \context {
    \Staff \RemoveEmptyStaves
    \override VerticalAxisGroup.remove-first = ##t
    }
  }
}

\score {
  \midi {\tempo 4 = 90 }
  \unfoldRepeats
  \gigaStaff
}

date = #(strftime "%d-%m-%Y %H:%M" (localtime (current-time)))
\paper {
  oddFooterMarkup = \markup {
      Compiled \date
  }
  evenFooterMarkup = \oddFooterMarkup
}

