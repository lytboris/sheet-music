\version "2.22.0"

\header {
title = "Браво - Как жаль"
}

\layout {
  \context {
    \Score
    skipBars = ##t
  }
}

guit_G  =	\relative g' { r8  g8^G  b8  d8  b4 -. }
guit_G_short =	\relative g { <b d g>4.^G -. r4. }
guit_G_stroke =	\relative g' { g8^G  b8  d8  <b, d g>4. -. }
guit_Em =	\relative g' { r8^Em  e8  g8  b8  g4 -. }
guit_EmChorus =	\relative g' { e8^Em  g8  b8  e8  e,8  g8 }
guit_Am  =	\relative g  { r8^Am  c8  e8  a4. -. }
guit_Fism =	\relative g' { r8^\markup {"F#m"}  fis8  a8  c4. -. }
guit_FismSept =	\relative g' { <fis a c d>4.^\markup {"F#m7"} -.  <fis a c d>4. -. }
guit_C = 	\relative g' { r8  e8^C  g8  c4. -. }
guit_C_stroke =	\relative g  { c8  e^C g <e g c>4. -. }
guit_Cm =	\relative g' { r8  dis8^Cm  g8  d'8  c8  a8 }
guit_Cm_stroke= \relative g { c8^Cm  dis8  g8  <dis g c>4. -. }
guit_B =	\relative g  { b8^B  dis8  fis8  <dis fis b>4. -. }
guit_D =	\relative g' { d8^D  fis8  a8  <fis a d>4. -. }
guit_UnknChorus = \relative g'' {  fis8  e,8  g8  g'4. }

guitnotesVerseEnvelope = \relative g' {
  \guit_G | 
  \guit_Em | 
  \guit_Am |
  \guit_Fism |
}

guitnotesVerseEnvelopeVerse = \relative g' {
  \guit_G | 
  \guit_Em | 
  \guit_Am | 
    
}

guitarnotes =  \relative g' {
  \clef "treble" \time 6/8 \key g \major | 
  \guitnotesVerseEnvelope
  \guitnotesVerseEnvelopeVerse
  \guit_FismSept | 
  \repeat volta 2 {
% verse
  \repeat volta 2 {
  \guitnotesVerseEnvelope
  \guitnotesVerseEnvelopeVerse
  \guit_FismSept | 
  \guitnotesVerseEnvelope
  \guit_C | 
  \guit_Cm | 
  }
  \alternative {{
    \set Score.repeatCommands = #'((volta "1. второй куплет без повтора"))
    \guit_G_short |  R2. | }{}}
  \set Score.repeatCommands = #'((volta #f))
  \break
  \guit_G_short | 
  R2. | 
% chorus
   \guit_C_stroke | 
   \guit_B | 
   \guit_EmChorus | 
   \guit_UnknChorus | 
   \guit_C | 
   \guit_B | 
   \guit_EmChorus | 
   \guit_UnknChorus | 
   \guit_C |
   \guit_B | 
   \guit_EmChorus | 
   \guit_UnknChorus | 
   \guit_C | 
   \guit_D | 
   \guit_G_stroke | 
   \guit_Cm_stroke | 
  }
  \alternative {{
  \set Score.repeatCommands = #'((volta "1. в куплет"))
  \guit_G_short | 
  R2. | 
  } {
  \set Score.repeatCommands = #'((volta #f))
   <b, d g>4. -.  g'8  b8  d8 }} \tempo
  4=90 | 
   e4 d4 b8  a8 | 
   g4. r4. \bar "|."
}

mennotesVerseEnvelope = \relative d {
   <d g>4. -. r4  <d g>8 |
   <b e>4. -. r4  <b e>8 | 
   <c g'>4. -. r4  <c g'>8 |
   <d a'>4. -.  <d a'>8  <e b'>8  <d a'>8 |
}

mennotesVerseEnvelopeVerse = \relative d {
   <d g>4. -. r4  <d g>8 |
   <b e>4. -. r4  <b e>8 |
   <c g'>4. -. r4. |
}

tenornotesFintOne = \relative d {
  r8 d4 e8 g b |
  d4 e g8. a16 |
   b8 g << { \tiny b8 a4. } \\ { e8  d4. } >> |
}

tenornotesFintTwo = \relative d {
   r4 d8  e g8. a16
   b4  a8 ~  a8  g8  e8 |
}

tenornotesChorus = \relative d {
   c4.  d4. |
   e2. |
   fis2. |
   r4.  b4. |
   a4.  fis4. |
   g4.  e4. |
   fis4. r4. |
   r4.  e4. |
   fis4.  e8  d8  e8 |
   c2. |
   b2. |
   r4.  b'4. | 
   a4.  fis4. | 
   g4.  e4. |
   fis4. r4. |
}


chorusnotes =  \relative d {
  \clef "treble_8" \time 6/8 \key g \major | % 1
  \mennotesVerseEnvelope
  \mennotesVerseEnvelopeVerse
  R2. |
  % verse
  \set Score.voltaSpannerDuration = #(ly:make-moment 3/2)
  \repeat volta 2 {
  \repeat volta 2 {
  \mennotesVerseEnvelope
  <d g>4. r4. |
  \tenornotesFintOne
  \mennotesVerseEnvelope
  <g c,>2. ~ ~ |
   <g c,>2. |
  }
  \alternative {{\tenornotesFintTwo}{}}
  R2. |
  \tenornotesChorus
  R2.*2 |
  }
  \alternative {{ R2.*2 }
  { R2. }}
  R2.*2 \bar "|."
}
mennotesAltEnding = \relative g' {
    <c e>2. |
   <b dis>2. | 
   <b e>2. |
   <b d>2. |
   <c e>2. |
   <b dis>2. |
   <b e>2. |
   <b d>2. |
   <c e>2. |
   <b dis>2. |
   <b e>2. |
   <b d>2. | 
   <c e>2. |
   <d fis>2. |
   <b d>2. |
   <c dis>2. |
  R2.*3 \bar "|."
}

altonotesVerse = \relative d' {
  < \tweak font-size #-2 d' b>4 < \tweak font-size #-2 e c>8 r < \tweak font-size #-2 d b> < \tweak font-size #-2 c a> |
  < \tweak font-size #-2 c a>( < \tweak font-size #-2 b g>4) ~ ~ < \tweak font-size #-2 b g>4. |
  r4  e,4 g8  a8 |
   b8  a4  g4  e8 |
   d2 r4 |
  R2.*2 |
  r4. r4  d8 | % 17
   < \tweak font-size #-2 d' b>4 < \tweak font-size #-2 e c>8 < \tweak font-size #-2 d b>4 < \tweak font-size #-2 c a>8 |
   < \tweak font-size #-2 c a>( < \tweak font-size #-2 b g>4) ~ ~ < \tweak font-size #-2 b g>4. |
  r4  e,4  g8  a8 | 
   b4  a8 r8  g8  a8 |
   g2. |
}

altonotesChorus = \relative d' {
   r4. g4. |
   a4. r4  b8 |
   d4. ~  d8 r8  c8 |
   b4  c8 r8  b8  a8 |
   g2. |
  R2. |
   r4  g8  g4  g8 |
   a4.  fis4 g8~ |
   g2. |
   r4  g8 ~  g8  a8  b8 |
   d4. ~  d8 r8  c8 |
   b4  c8 ~  c8  b8  a8 |
   g2. |
  R2. |
  r4  g8  g4  g8 |
   fis4.  a4 g8~ |
   g2. ~ |
   g2. |
}

altonotes =  \relative d' {
  \clef "treble" \time 6/8 \key g \major |
  R2.*7 |
  r4. r4  d8 \mark \markup {\box "Куплет"} |
  \repeat volta 2 {
  \repeat volta 2 {
  \altonotesVerse
  R2.
  }
  \alternative {{R2. | r4. r4  d8 | }{}}
  \mark \markup {\box "Припев"}
  \altonotesChorus
  }
  \alternative {{ R2. |
  r4. r4  d8 |
  } { R2. } }
  R2.*2 \bar "|."
}

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace80"
}

altowordsVerseOne = \lyricmode {
  \set stanza = \markup {
    \column { \vspace #.33 "1. "}
    \leftbrace
  }
На тем ный ряд до мов __
Лишь о ди но кий свет в__ок не.
И стук мо их ша гов __
Зву чит в__пол ноч ной ти ши не. По
}

altowordsVerseOnea = \lyricmode {
По э той мос то вой __
Вдоль э тих скве ров до ут ра.
Бро ди ли мы с__то бой, __
И э то бы ло, как вче ра.
}

altowordsVerseTwo = \lyricmode {
\set stanza = "2. "
Все так же, как тог да, __
Та кой же мяг кий, лун ный свет,
Блес тит в__ре ке во да, __
И лишь те бя со мно ю нет.
}

altowordsChorus = \lyricmode {
Как жаль,
Но ты се го дня не со мной,
И толь ко каж дый раз,
Ког да и ду по э той мос то вой,
Я ду ма ю о нас __

Все
}

altowords = {
  << 
  { \altowordsVerseOne }
  \new Lyrics {
    \set associatedVoice = "alto"
    \altowordsVerseOnea
  }
  \new Lyrics {
    \set associatedVoice = "alto"
    \altowordsVerseTwo
  }
  >>
  \altowordsChorus
}
  

% The score definition
gigaStaff = {
<<
  \new Staff
    <<
      \set Staff.instrumentName = "A. Guitar"
      \set Staff.shortInstrumentName = "G."
      \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      \set Staff.midiMinimumVolume = #0.3
      \set Staff.midiMaximumVolume = #0.5
      \context Staff <<
        \context Voice = "guitar" {  \guitarnotes }
      >>
    >>
  \new ChoirStaff \with {midiInstrument = #"choir aahs"} <<
    \new Staff
    <<
      \set Staff.instrumentName = "Men"
      \set Staff.shortInstrumentName = "M."
      \set Staff.midiMinimumVolume = #0.3
      \set Staff.midiMaximumVolume = #0.5
      \context Staff <<
        \context Voice = "Chorus" {  \chorusnotes }
      >>
    >>
    \new Staff
    <<
      \set Staff.instrumentName = "Alto"
      \set Staff.shortInstrumentName = "A."

      \new Voice = "alto" <<
        \altonotes
        \context Lyrics = "alto" \lyricsto "alto" \altowords
      >>
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
  \midi {\tempo 4 = 105 }
}


date = #(strftime "%d-%m-%Y %H:%M" (localtime (current-time)))
\paper {
  oddFooterMarkup = \markup {
      Compiled \date
  }
  evenFooterMarkup = \oddFooterMarkup
}
