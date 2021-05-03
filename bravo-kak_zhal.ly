\version "2.22.0"


\header {
}

\layout {
  \context {
    \Score
    skipBars = ##t
  }
}

guit_G  =	\relative g' { r8  g8  b8  d8  b4 -. }
guit_G_short =	\relative g { <b d g>4. -. r4. }
guit_G_stroke =	\relative g' { g8  b8  d8  <b d g>4. -. }
guit_Em =	\relative g' { r8  e8  g8  b8  g4 -. }
guit_EmChorus =	\relative g' { e8  g8  b8  e8  e,8  g8 }
guit_Am  =	\relative g  { r8  c8  e8  a4. -. }
guit_Fism =	\relative g' { r8  fis8  a8  c4. -. }
guit_FismSept =	\relative g' { <fis a c d>4. -.  <fis a c d>4. -. }
guit_C = 	\relative g' { r8  e8  g8  c4. -. }
guit_C_stroke =	\relative g  { c8  e g <e g c>4. -. }
guit_Cm =	\relative g' { r8  dis8  g8  d'8  c8  a8 }
guit_Cm_stroke= \relative g { c8  dis8  g8  <dis g c>4. -. }
guit_B =	\relative g  { b8  dis8  fis8  <dis fis b>4. -. }
guit_D =	\relative g' { d8  fis8  a8  <fis a d>4. -. }
guit_UnknChorus = \relative g'' {  fis8  e,8  g8  g'4. }

guitnotesVerseEnvelope = \relative g' {
  \guit_G | % 2
  \guit_Em | % 3
  \guit_Am | % 4
  \guit_Fism | % 5
}

guitnotesVerseEnvelopeVerse = \relative g' {
  \guit_G | % 6
  \guit_Em | % 7
  \guit_Am | % 8
    
}

PartPOneVoiceOne =  \relative g' {
  \clef "treble" \time 6/8 \key g \major | % 1
  \guitnotesVerseEnvelope
  \guitnotesVerseEnvelopeVerse
  \guit_FismSept | % 9
  \repeat volta 2 {
  \guitnotesVerseEnvelope
  \guitnotesVerseEnvelopeVerse
  \guit_FismSept | % 9
  \guitnotesVerseEnvelope
  \guit_C | % 22
  \guit_Cm | % 23
  }
  \alternative {{  \guit_G_short | % 24
  R2. | }}
  \repeat volta 2 {
   \guit_G_short | R2.
   \guit_C_stroke | % 42
   \guit_B | % 43
   \guit_EmChorus | % 44
   \guit_UnknChorus | % 45
   \guit_C | % 46
   \guit_B | % 47
   \guit_EmChorus | % 48
   \guit_UnknChorus | % 49
   \guit_C |
   \guit_B | % 51
   \guit_EmChorus | % 52
   \guit_UnknChorus | % 53
   \guit_C | % 54
   \guit_D | % 55
   \guit_G_stroke | % 56
   \guit_Cm_stroke | % 57
  }
  \alternative {{ \guit_G_short | % 58
  R2. | % 59
  } { <b d g>4. -.  g8  b8  d8 }} \tempo
  4=90 | % 115
   e4 d4 b8  a8 | % 116
   g4. r4. \bar "|."
}

mennotesVerseEnvelope = \relative d {
   <d g>4. -. r4  <d g>8 | % 2
   <b e>4. -. r4  <b e>8 | % 3
   <c g'>4. -. r4  <c g'>8 | % 4
   <d a'>4. -.  <d a'>8  <e b'>8  <d a'>8 | % 5
}

mennotesVerseEnvelopeVerse = \relative d {
   <d g>4. -. r4  <d g>8 | % 6
   <b e>4. -. r4  <b e>8 | % 7
   <c g'>4. -. r4. | % 8
}

tenornotesFintOne = \relative d {
  r8 d4 e8 g b | % 15
  d4 e g8. a16 | % 16
   b8 g << { \tiny b8 a4. } \\ { e8  d4. } >> | % 17
}

tenornotesFintTwo = \relative d {
   r4 d8  e g8. a16 %24
   b4  a8 ~  a8  g8  e8 | % 25
}

tenornotesChorus = \relative d {
   c4.  d4. | % 41
   e2. | % 42
   fis2. | % 43
   r4.  b4. | % 44
   a4.  fis4. | % 45
   g4.  e4. | % 46
   fis4. r4. | % 47
   r4.  e4. | % 48
   fis4.  e8  d8  e8 | % 49
   c2. |
   b2. | % 51
   r4.  b'4. | % 52
   a4.  fis4. | % 53
   g4.  e4. | % 54
   fis4. r4. | % 55
}


PartPTwoVoiceOne =  \relative d {
  \clef "treble_8" \time 6/8 \key g \major | % 1
  \mennotesVerseEnvelope
  \mennotesVerseEnvelopeVerse
  R2. | % 9
  \repeat volta 2 {
  \mennotesVerseEnvelope
  <d g>4. r4. | % 6
  \tenornotesFintOne
  \mennotesVerseEnvelope
  <g c,>2. ~ ~ | % 22
   <g c,>2. | % 23
  }
  \alternative {{ \tenornotesFintTwo }
  { R2. | }} % 45
  \repeat volta 2 {
  R2.
  \tenornotesChorus
  R2.*2 | % 59
  }
  \alternative {{ R2.*2 }
  { R2. }}
  R2.*2 \bar "|."
}
mennotesAltEnding = \relative g' {
    <c e>2. | % 99
   <b dis>2. | 
   <b e>2. | % 101
   <b d>2. | % 102
   <c e>2. | % 103
   <b dis>2. | % 104
   <b e>2. | % 105
   <b d>2. | % 106
   <c e>2. | % 107
   <b dis>2. | % 108
   <b e>2. | % 109
   <b d>2. | 
   <c e>2. | % 111
   <d fis>2. | % 112
   <b d>2. | % 113
   <c dis>2. | % 114
  R2.*3 \bar "|."
}

altonotesVerse = \relative d' {
  << \tiny {d'4 e8 r d c | c b4 ~ ~ b4.} \\
  { b4 c8 r b a | a g4 ~ ~ g4.} >> |
  r4  e4 g8  a8 | % 12
   b8  a4  g4  e8 | % 13
   d2 r4 | % 14
  R2.*2 \break | % 16
  r4. r4  d8 | % 17
   << \tiny {d'4 e8 d4 c8 | c b4 ~ ~ b4.} \\
   {b4 c8 b4 a8 | a g4 ~ ~ g4.}
    >> |
  r4  e4  g8  a8 | 
   b4  a8 r8  g8  a8 | % 21
   g2. | % 22
}

altonotesChorus = \relative d' {
   r4. g4. | % 40
   a4. r4  b8 | % 41
   d4. ~  d8 r8  c8 | % 42
   b4  c8 r8  b8  a8 | % 43
   g2. | % 44
  R2. | % 45
   r4  g8  g4  g8 | % 46
   a4.  fis4 g8~ | % 47
   g2. | % 48
   \break
   r4  g8 ~  g8  a8  b8 | % 49
   d4. ~  d8 r8  c8 |
   b4  c8 ~  c8  b8  a8 | % 51
   g2. | % 52
  R2. | % 53
  r4  g8  g4  g8 | % 54
   fis4.  a4 g8~ | % 55
   g2. ~ | % 56
   g2. | % 57
}

PartPThreeVoiceOne =  \relative d' {
  \clef "treble" \time 6/8 \key g \major | % 1
  R2.*7 \break | % 8 
  r4. r4  d8 | % 9
  \repeat volta 2 {
  \altonotesVerse
  R2.*2 \break | % 24
  }
  \alternative { {  r4. r4  d8 |   }
  }
  \break
  \mark \markup {\box "Припев"}
  \repeat volta 2 {
  \altonotesChorus
  \break
  }
  \alternative {{   R2. | % 58
  r4. r4  d8 | % 59
  } { R2. } }
  R2.*2 \bar "|."
}

% The score definition
gigaStaff = {
  \new ChoirStaff \with {midiInstrument = #"choir aahs"} <<
    \new Staff
    <<
      \set Staff.instrumentName = "A. Guitar"
      \set Staff.shortInstrumentName = "G."
      \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      \set Staff.midiMinimumVolume = #0.4
      \set Staff.midiMaximumVolume = #0.6
      \context Staff <<
        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Men"
      \set Staff.shortInstrumentName = "M."

      \context Staff <<
        \context Voice = "PartPTwoVoiceOne" {  \PartPTwoVoiceOne }
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Alto"
      \set Staff.shortInstrumentName = "A."

      \context Staff <<
        \context Voice = "PartPThreeVoiceOne" {  \PartPThreeVoiceOne }
      >>
    >>
  >>
}

\score {
  \gigaStaff
  \layout {}
}

\score {
  \unfoldRepeats 
  \gigaStaff
  \midi {\tempo 4 = 90 }
}
