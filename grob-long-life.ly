\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

\header{
  title = "Долгая счастливая жизнь (ГрОб)"
}

global = {
  \key c \major
  \time 4/4
}

%%%%%%%%%%
% Soprano
%%%%%%%%%%

sopMusicChorus = \relative {
  g'8 g g g fis fis fis g~ | g2~ g8 c c c | b b b b a a a 
  \tag #'normalChorus { g~ | g4 a\rest a8\rest }
% coda does not contain rest here, cut it with tags
  \tag #'codaChorus { \stemUp { g~ | g2~ g8 } }
  c c c | d b b b a a a b~ | b2 a8 a a a | g2 fis8 g a fis |
  g8.( a16 b4) a8 a a a |
% this goes into alternative in coda  
  \tag #'normalChorus { g2 b8 b b b } |
}

sopPreChorusMusic = \relative {
a'2~\( a | g~ g\) | a~\( a | g~ g\) |
  a~\( a | g( fis)\) | }

shoutOutWords = \markup \italic \column {
 "Искушениям и праздни кам -   нет"
 "Преступлениям и праздникам - нет"
 "Исключениям и праздникам -   нет!    Нет! Нет!"
}

sopMusic = \relative {
  \partial 4 d'8 e | f f f f e e e e~ | e r8 r2 d8 e | f4 f8 f e e e e~ | e r8 r4 r4 d8 e |
  f f f f e e e e~ | e1 | 
  \mark \markup  { \box "1 куплет"}
  \sopPreChorusMusic
  \mark \markup { \box "Припев"}
  \removeWithTag #'codaChorus
  \repeat volta 2 { \sopMusicChorus }
  \alternative
  { {
    b'2. a4\rest | \mark \markup { \box "2 куплет"} a2~\( a | gis1\) | a2~\( a |
    gis1\) | a2~ a | gis2. e8 d16 c~ | c4  a8. a16 a'8 g f g~ | g2 a4\rest b,8 b16 c~ |
    c4 a8 a c' b a g~ | g2 a4\rest e8 d | e e e e e' d c g~ | g2( a) |
  }
  { b1 }
  }
  % intermission
  a2~ \tuplet 3/2 4 { a8 a b c b a } | b4 gis e2 | f a4 f | e1 |
  \repeat volta 3 { f2 \mark \markup { \shoutOutWords } e4. e8 | }
  \alternative {{r2 e}{r4 e8 r e r r4}}
  \mark \markup  { \box "3 куплет"}
  \sopPreChorusMusic
  \pageBreak
  \mark \markup { \box "Кода"}
  \removeWithTag #'normalChorus
  \repeat volta 2 { \sopMusicChorus }
  \alternative {{g2 b8 b b b}{g2 b8 b b b | b1}}
}

%%%%%%%
% Alto
%%%%%%%

altoMusicChorus = \relative {
  d'8 d d d dis dis dis e~ | e2~ e8 g g g | g d d d dis dis dis 
  \tag #'normalChorus { e~ | e4 s s8 } 
  \tag #'codaChorus { \stemUp { \once \omit Flag e~ | e2~ \once \omit Flag e8 } }
  g g g | b g g g fis fis fis g~ | g2 fis8 fis fis fis | e2 dis8 e fis dis |
  e8.( fis16 g4) fis8 fis fis fis | \tag #'normalChorus { e2 fis8 fis fis fis } |  
}

altoPreChorusMusic = \relative {
e'2\( f | e( d)\) | e~\( f | e d\) |
  e\( f | e( fis)\) | 
}

altoMusic = \relative {
  \partial 4 a8  b | c c c c c c c b~ | b r8 r2 a8 b | c4 c8 c c c c b~ | b r8 r4 r4 a8 b |
  c c c c c c c  b~ | b1 |
  \altoPreChorusMusic
  \removeWithTag #'codaChorus
  \repeat volta 2 {  \altoMusicChorus }
  \alternative
  { {                  
% 2 verse
    g'2. s4 | f2\( e | e1\) | f2\( e |
    e1 | f2 e | e2. e8 d16 c~ | c4  a8. a16 f'8 e d e~ | e2 s4 b8 b16 c~ |
    c4 a8 a a' g f e~ | e2 s4  e8 d | e e e e <c' a> <b g> <a f> e~ | e2 fis |
  }                
  { g1 }
  }
% intermission
  << { \voiceOne s1*4 } \new Voice { \voiceTwo f2~ \tuplet 3/2 4 { f8 f g a g f } | e1 | c | e | } >> \oneVoice
   { \repeat volta 3 { c2 c4. b8 | }
  \alternative {{r2 b}{ r4 e8 r e r r4}}
  }
  \altoPreChorusMusic
% coda
  \removeWithTag #'normalChorus
  \repeat volta 2 { \altoMusicChorus }
  \alternative {{e2 fis8 fis fis fis} {e2 fis8 fis fis fis | gis1}}

}

%%%%%%%%
% Tenor
%%%%%%%%

tenorMusicChorus = \relative {
  b8 b b b b b b b~ | b2~ b8 e e e | d b b b b b b 
  \tag #'normalChorus { b~ | b4 s s8 }
  \tag #'codaChorus { \stemUp { \once \omit Flag b~ | b2~ \once \omit Flag b8 } }
  e e e | g d d d dis dis dis e~ | e2 d!8 d d d | c2 b8 b b b |
  << { \voiceOne s2 } \new Voice { \voiceTwo b2~ } >> \oneVoice d8 d d d | \tag #'normalChorus { c2 dis8 dis dis dis } |
}

tenorPreChorusMusic = \relative {
 \stemUp { c'2~\( c | c( b)\) | c~\( c | c( b)\) |
  c~\( c | c( d)\) |  }
}

tenorMusicIntermission = {
c'2. a4 | b2. e8 d | c2~ \tuplet 3/2 4 { c8 a b c b a } | d2 b |
    \repeat volta 3 { a2 a4. b8|}
  \alternative {{d,2\rest b' }{d,4\rest b'8 d,\rest b' d,\rest b'4\rest}}
}

tenorMusic = \relative {
  \partial 4 a8 b | a a a a a a a gis~ | gis r8 r2 a8 b | a4 a8 a a a a gis~ | gis r8 r4 r4 a8 b | 
  a a a a a a a gis~ | gis1 | 
  \tenorPreChorusMusic
  \removeWithTag #'codaChorus
  \repeat volta 2 { \tenorMusicChorus }
  \alternative
  { {
% 2 verse
    e'2. s4 | c2\( c | b1\) | c2\( c |
    b1 | c2~ c | b2. c8 b16 a~ | a4 a8. a16 c8 c c c~ | c2 s4 gis8 gis16 a~ |
    a4 a8 a c c c c~ | c2 s4 b8 b | c c c c c c c c~ | c2( d) |
  }
  { e1 }
  }
  %% intermission - moved to bass staff
  \tag #'printonly { s1*4 | \repeat volta 3 { s1 } \alternative {{s1}{s1}} }
  \tag #'midionly { \relative c { \tenorMusicIntermission } }
  \tenorPreChorusMusic
  %coda
  \removeWithTag #'normalChorus
  \repeat volta 2 { \tenorMusicChorus }
  \alternative{{c2 dis8 dis dis dis}{c2 dis8 dis dis dis | e1 }}
}

% This part goes to tenor in midi but should be in bass clef
tenorMusicBassClefCoda = {
  g8 g g g fis fis fis g~ | g2~ g8 c c c | b b b b  a a a g~ |
  g2~ g8 c c c| d b16( a) g8 b a a a b~ | b2 a8 a a a | g2 fis8 g a fis | g8.( a16 b4) a8 a a a |
}

%%%%%%%
% Bass
%%%%%%%

bassMusicChorus = \relative {
  g8 g g g b, b b e~ | e2~ e8 c c c | g' g g g b, b b e~ |
  e4 r r8 c c c| g' g g g b, b b e~ | e2 d8 d d d | c2 b8 b b b |
  e2 d8 d d d | c2 b8 b b b | 
}

bassMusic = \relative {
  \partial 4 d8 e | f f f f e e e e~ | e r8 r2 d8 e | f4 f8 f e e e e~ | e r8 r4 r4 d8 e |
  f f f f e e e e~ | e2. r8 c8 | a a a a16 a'~ a8 g f e~ | e2. a,8 b | c4 a8 a16 a'~ a8 g f e~ | e2. a,8 b |
  c b c c a' g f g~ | g2( a) | 
  \repeat volta 2 { \bassMusicChorus }
  \alternative
  { {
    e2. d8 e | f f f f e e e8 e8~ | e2. d8 e | f4 f8 f e e e e~ |
    e2. d8 e | f4 f8 f e e e e~ | e4 e e e8 d16 c~ | c4  a8. a16 a'8 g f g~( | g4. f8 e4) e8 e16 e~ |
    e4 e8 e f f f g~ | g2 r4 g8 g | a a a g f f f g~ | g2( d) |
  }
  { e1 }
  }
  << { \voiceTwo  { f1 | e | f2~ \tuplet 3/2 4 { f8 f g a g f } | e1 | }
     \repeat volta 3 {f2 a,4. e'8|}
     \alternative {{ s2 e }{ s4 e8 s e s c8 b | }}}
  %% tenor temporarily moved to bass clef
  \new Voice { \voiceOne \tag #'printonly { \tenorMusicIntermission } }
  >> \oneVoice
  a,8 a a a16 a'~ a8 g f e~ | e2. a,8 b | c a  a a16 a'~ a8 g f e~ | e2. e8 d |
  e e e e f f f g~| g2( a) | 
  % Coda chorus
  \repeat volta 2 { <<\voiceOne { \tag #'printonly { \tenorMusicBassClefCoda } }
    \new Voice {\voiceTwo
      g2 b, | e c8 c c c | g'2 b, | e~ e8 c c c | g'2 b, | e d | c b | e d8 d d d 
    } >> \oneVoice }
  \alternative {
    { <<{\stemDown {c2 b8 b b b}} {g'2 s2}>> | }
    { <<{g2 b,8 b b b | e1} {c2 b'8 b b b | b1}>> }
  }
}

% The very last chorus is enriched with one more voice. Midi-only (due to unrolled repeats)
% rest measures are put in place in a crude way
fluteMusic = \relative c'' {
  \partial 4 s4 | s1*48
  \tag #'midionly { s1*21 }
  \repeat percent 2 { g8 d b g' fis dis b fis' | e b e d c e g e |}
   g8 d b g' fis dis b fis' | e b e d fis d a d | g e c e dis b dis fis | e b e d fis d a d |
  \tag #'printonly { c2 dis8 dis dis dis} { c2 dis8 dis dis dis | e1 }
}

%%%%%%%%%
% Lyrics
%%%%%%%%%

chorusWords = \lyricmode {
 { Дол гая я счаст ли ва я жизнь, __ та ка я дол га я счаст ли ва я жизнь,
 от ны не дол га я счаст ли ва я жизнь, каж до му из нас, каж до му из
 нас, каж до му из нас, каж до му из нас. }
}

bassFirstVerseWords =  \lyricmode {
 Без рыбь е в_зо ло той по лы нье, __ ве зде сущ ность мы ши ной во зни, __ злы е
 cу мер ки бес смерт но го дня __ 
}

bassWords =  \lyricmode {
 \set stanza = "Соло: "
 "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
 "" "" "" "" "" "" "" "" "" "" "" "" "" ""
 Без рыбь е в_зо ло той по лы нье, __ ве зде сущ ность мы ши ной во зни, __ злы е
 cу мер ки бес смерт но го дня __ 
 "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
 "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
 "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
 "" "" "" "" ""
 Бес по щад ны е глу би ны мор щин.
 Ма ри ан ски е впа ди ны глаз __
 Мар си ан ски е хро ни ки нас, нас, нас.
 "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
 "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
 "" "" "" "" "" "" "" "" "" "" "" "" "" ""
 На се ми __ про ду_"" вных скво зня ках __
 По бо ло там, по пу сты ням, сте пям __
 По су гро бам, по гря зи, по зе мле __
}

everybodyWords = \lyricmode {
\set stanza = "Все: "
  По тря се ни ям и пра здни кам -- нет!
  Го ри зон там и праз дни кам -- нет!
  Вдох но ве ни ям и праз дни кам нет!
"" "" "" "" "" ""
\chorusWords
 "" "" "" "" "" ""
 Пос ре ди __ о ди на ко вых стен __
 В_гро бо вых __ от да лён ных до мах __
 В_не про гляд ной ле дя ной ти ши не __
 нас.
"" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
нет! "" "" "" "" "" "" "" "" ""
\chorusWords каж до му из нас.
}

date = #(strftime "%d-%m-%Y %H:%M" (localtime (current-time)))
  \paper {
    oddFooterMarkup = \markup {
        Compiled \date
    }
    evenFooterMarkup = \oddFooterMarkup
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Global score structure
%%%%%%%%%%%%%%%%%%%%%%%%%%

% Print-firendly score, midi-only notes are omitted
\score {
  \layout {
    \context {
    \Staff \RemoveEmptyStaves
    \override VerticalAxisGroup.remove-first = ##t
    }
  }
  \removeWithTag #'midionly
  \new ChoirStaff
  <<
    \new Staff = "women"
    <<
      \new Voice = "sopranos" {
      <<
        \global
        \sopMusic
        \altoMusic
        \tenorMusic
      >>
      \bar "|."
      }
    >>
    \new Lyrics = "everybody" \with { alignBelowContext = "women" }
    \new Staff = "men"
    <<
      \clef bass
      \new Voice = "basses" {
        <<
          \global \bassMusic
        >>
      }
    >>
    \new Lyrics = "basses"
    \new Staff {
      \once \omit Staff.TimeSignature
      \global  \fluteMusic
    }

    \context Lyrics = "everybody" \lyricsto "sopranos" \everybodyWords
    \context Lyrics = "basses" \lyricsto "basses" \bassWords
  >>
}

% midi-specific score, print-only notes are omitted
\score {
  \midi { \tempo 4= 98 }
  \unfoldRepeats
  \removeWithTag #'printonly
  \new ChoirStaff
  <<
   \new Staff = "sopranos" \with {midiInstrument = #"clarinet"} <<
      \new Voice = "sopranos" { \global \sopMusic }
    >>
    \new Staff = "altos" \with {midiInstrument = #"clarinet"} <<
      \new Voice = "altos" { \global \altoMusic }
    >>
    \new Staff = "tenors" \with {midiInstrument = #"clarinet"} <<
      \new Voice = "tenors" { \global \tenorMusic }
    >>
    \new Staff = "men" \with {midiInstrument = #"cello"}  <<
      \new Voice = "basses" { \global \bassMusic }
    >>
    \new Staff \with {midiInstrument = #"flute"} <<
      \new Voice = "flute" { \global \fluteMusic }
    >>
  >>
}
