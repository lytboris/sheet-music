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

date = #(strftime "%d-%m-%Y %H:%M" (localtime (current-time)))
\paper {
  oddFooterMarkup = \markup { Compiled \date }
  evenFooterMarkup = \oddFooterMarkup
}

global = { \numericTimeSignature\time 4/4 \key c \major }

sopranoMusicVerse = \relative e' {
   e2  dis2 | % 18
   g2  fis2 | % 19
   e2  dis2 | % 20
   e1 | % 21
   c2  d2
}

sopranoMusic =  \relative e' {
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
   \sopranoMusicVerse | \break % 22
   e2.  g4 ~ | % 23
   g4  e2  f8 [  e8 ] | % 24
   r4  a2  g4~ | % 25
   g4 ( e4 d2 ) | % 26
   c2  d2 | % 27
   e4 (  d2. ) | % 28
   g2  g2 | % 29
   e1 | \pageBreak % 30
   \sopranoMusicVerse | \break % 35
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

sopranoLyrics =  \lyricmode {
  \set ignoreMelismata = ##t
  Shall I "stay?" be a "sin?" I "can't" help fal -- ling in love with
  "you." Ah -- ah ah -- ah ah -- ah ah ah -- ah Take my\skip1 hand
  take my whole life too\skip1 \skip1 I "can't" he -- lp love with
  "you." Ah -- ah ah -- ah ah -- ah ah ah -- ah dmm -- mm dmm dmm --
  mm dmm dmm -- mm dmm dmm dmm dmm dmm dmm dmm\skip1 \skip1
}

altoMusicVerse = \relative c' {
  b1 | % 18
   e2  dis2 | % 19
  b1 | % 20
  c1 | % 21
   a2  b2 | % 22
}

altoMusicChorus = \relative c' {
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


altoMusic =  \relative c' {
  \clef "treble" | % 1
  \removeWithTag #'secondIntroChorus \altoMusicChorus |
  c1 | \break % 9
  \removeWithTag #'normalChorus \altoMusicChorus |
  c1 | % 17
  \altoMusicVerse |
  \removeWithTag #'secondIntroChorus \altoMusicChorus |
  c1 | % 30
  \altoMusicVerse |
    \removeWithTag #'secondIntroChorus \altoMusicChorus |
  c2. r8  g8 | % 43
   a2  b2 | % 44
   c2 \times 2/3 {
     d4  e4  f4
  }
  | % 45
   e2  d2 ^\fermata | % 46
  c1 ^\fermata \bar "|."
}

altoLyricsChorus = \lyricmode {
Take my "hand," take my whole life too for I "can't" help fal -- ling in
  love with "you."}

altoLyrics =  \lyricmode {
  \set ignoreMelismata = ##t Wise
  men say on -- ly fools rush in but I "can't" help fal -- ling in
  love with "you." Shall I "stay?" Would it be a "sin?" If I "can't"
  help fal -- ling in love with "you." Ah ah -- ah ah ah ah -- ah 
  \altoLyricsChorus
  Ah ah -- ah ah ah ah -- ah \altoLyricsChorus
  for I "can't" help fal -- ling in love with "you."
}

tenorMusicVerse = \relative c {
   b8. [  e8.  g16  b16~ ]  b16 (
   a4.. ) | % 18
   b,8. [  e8.  g16  b16~ ]  b16 (
   a4.. ) | % 19
   b,8. [  e8.  g16  b16~ ]  b16 (
   a4.. ) | %20
   g8.  g4..  e8 [  g8  e8 ] | % 21
   f2 (  g2 ) | % 22
}

tenorMusic =  \relative c' {
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
   \tenorMusicVerse |
   c'2  b2 | % 23
   a4 (  g4 f4 g4 ) | % 24
   c2  c2 | % 25
   b2. r8  g8 | % 26
   f4 (  e4 )  d4 (  g4 ) | % 27
   g4 (  a2. ) | % 28
   c2  b2 | % 29
  c1 | % 30
   \tenorMusicVerse |
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

tenorLyricsVerse = \lyricmode {
Like a riv -- er flo -- ws sure -- ly to the se -- a dar -- ling so it go
  -- es some things are meant to be -- e }

tenorLyrics =  \lyricmode {
  \set ignoreMelismata = ##t
  Shall I "stay?" be a "sin?" if I "can't" help love with "you." 
  \tenorLyricsVerse Take my ha -- a -- a -- and
  whole life too for I\skip1 ca -- "n't" help\skip1 love with "you."
  \tenorLyricsVerse dmm -- mm dmm dmm --
  mm -- dmm dmm -- mm dmm dmm -- mm -- dmm\skip1 \skip1 \skip1 \skip1
  \skip1 \skip1
}


% The score definition
\score {

\new ChoirStaff
<<
    \new Staff
    <<
      \set Staff.instrumentName = "Soprano"
      \set Staff.shortInstrumentName = "S."

      \context Staff <<
        \context Voice = "sopranoMusic" { \global \sopranoMusic }
        \new Lyrics \lyricsto "sopranoMusic" { \sopranoLyrics }
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Alto"
      \set Staff.shortInstrumentName = "A."

      \context Staff <<
        \context Voice = "altoMusic" { \global \altoMusic }
        \new Lyrics \lyricsto "altoMusic" { \altoLyrics }
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Tenor"
      \set Staff.shortInstrumentName = "T."

      \context Staff <<
        \context Voice = "tenorMusic" { \global \tenorMusic }
        \new Lyrics \lyricsto "tenorMusic" { \tenorLyrics }
      >>
    >>

  >>
  \layout {
   \context {
    \Staff \RemoveEmptyStaves
    \override VerticalAxisGroup.remove-first = ##t
    }
  }
}
\score {
  \unfoldRepeats
  \new ChoirStaff
  <<
    \new Staff = "s" \with {midiInstrument = #"clarinet"} <<
        \new Voice = "sopranoMusic" { \global \sopranoMusic }
    >>
    \new Staff = "a" \with {midiInstrument = #"clarinet"} <<
        \new Voice = "altoMusic" { \global \altoMusic }
    >>
    \new Staff = "t" \with {midiInstrument = #"clarinet"} <<
        \new Voice = "tenorMusic" { \global \tenorMusic }
    >>
  >>
  \midi {\tempo 4 = 90 }
}

