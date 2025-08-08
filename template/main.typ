#import "dewdrop.typ": *

#import "@preview/numbly:0.1.0": numbly

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "mini-slides",
  config-info(
    title: [Monash University Presentation Template],
    subtitle: [Enhanced with Official Brand Guidelines],
    author: [Your Name],
    date: datetime.today(),
    institution: [Monash University],
  ),
)

#title-slide(extra: [Department of Your Faculty])

#outline-slide()

= Introduction

== Welcome to Monash

#slide[
  == Welcome to Monash University

  This presentation template has been enhanced with:
  
  - *Official Monash University colors* including Monash Blue (\#006DAE)
  - *Helvetica Neue typography* as per brand guidelines  
  - *Professional layouts* suitable for academic presentations
  - *Accessible color combinations* meeting WCAG standards

  #v(1em)
  
  #block(
    fill: rgb("#006dae").lighten(95%),
    stroke: (left: 3pt + rgb("#006dae")),
    inset: 1em,
    radius: 2pt,
    [*Note:* This template follows Monash University's official brand guidelines for consistent professional appearance.]
  )
]

== Color Palette

#slide[
  == Monash University Color Palette
  
  The template includes the complete official color scheme:
  
  #grid(
    columns: 2,
    gutter: 1em,
    [
      *Primary Colors:*
      - Monash Blue: \#006DAE
      - Secondary Blue: \#00739D
      - White: \#FFFFFF
      - Black: \#000000
      - Dark Grey: \#3C3C3C
    ],
    [
      *Accent Colors:*
      - Monash Red: \#DF0021
      - Purple: \#6F64A9
      - Fuchsia: \#C90095
      - Light Grey: \#F8F9FA
    ]
  )
]

= Special Slide Types

== Information Slide

#info-slide[
  This is an *information slide* that uses Monash's secondary blue color for highlighting important information in a professional manner.
]

== Focus Slide  

#focus-slide[
  *Key Message*
  
  Focus slides use Monash Blue background for maximum impact
]

== Highlight Slide

#highlight-slide[
  *Important Announcement*
  
  This slide type uses Monash Red for urgent or critical information
]

= Advanced Features

== Typography & Styling

#slide[
  == Enhanced Typography
  
  The template now uses *Helvetica Neue* as per Monash brand guidelines:
  
  Heading Levels
  - *Level 1 headings* use Monash Blue
  - *Level 2 headings* use Secondary Blue  
  - *Level 3 headings* use Dark Grey
  
  Regular text includes:
  - **Bold text** in Monash Blue
  - *Italic text* in Secondary Blue
  - Standard paragraph text in black
  
  #v(1em)
  
  > This is a quote that demonstrates the clean typography and proper spacing used throughout the template.
]

== Content Examples

#slide[
  == Content Examples
  
  Here are various content types with enhanced Monash styling:
  
  #alert[This is an alert message using Monash Blue]
  
  *Lists work beautifully:*
  1. Numbered lists use consistent spacing
  2. Colors follow Monash brand guidelines  
  3. Typography is clean and readable
  
  *Bullet points:*
  - Enhanced readability
  - Professional appearance
  - Consistent with brand guidelines
  
  #block(
    fill: rgb("#df0021").lighten(90%),
    stroke: (left: 3pt + rgb("#df0021")),
    inset: 1em,
    radius: 2pt,
    [*Warning:* Important notices can use the Monash Red accent color for emphasis.]
  )
]

== Data & Tables

#slide[
  == Data Presentation
  
  Professional table styling with Monash colors:
  
  #table(
    columns: 3,
    stroke: (x, y) => (
      top: if y == 0 { 2pt + rgb("#006dae") } else { 0.5pt + gray },
      rest: 0.5pt + gray
    ),
    fill: (x, y) => if y == 0 { rgb("#006dae").lighten(90%) },
    table.header[*Metric*][*Q1*][*Q2*],
    [Students], [15,234], [16,891],
    [Research], [89%], [92%],  
    [Satisfaction], [4.2/5], [4.5/5]
  )
]

== Code Example

#slide[
  == Code Examples
  
  Code blocks with proper syntax highlighting:
  
  ```python
  def monash_welcome():
      """Welcome function for Monash presentations"""
      print("Welcome to Monash University!")
      return {"status": "success", "theme": "enhanced"}
  ```
  
  #v(0.5em)
  
  ```typst
  // Typst code for this enhanced theme
  #show: dewdrop-theme.with(
    aspect-ratio: "16-9",
    config-colors(primary: rgb("#006dae"))
  )
  ```
]

= Conclusion

== Summary

#slide[
  == Template Enhancements Summary
  
  This enhanced Monash template includes:
  
  #grid(
    columns: 2,
    gutter: 2em,
    [
      *Brand Compliance:*
      - Official Monash colors
      - Helvetica Neue typography
      - Professional layouts
      - Accessible design
    ],
    [
      *New Features:*
      - Info slides  
      - Highlight slides
      - Enhanced focus slides
      - Better section dividers
    ]
  )
  
  #v(1em)
  
  Perfect for academic presentations, research talks, and professional meetings.
]

#focus-slide[
  *Thank You!*
  
  Questions & Discussion
]
