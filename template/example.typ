#import "/template/dewdrop.typ": *

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  logo: image(
    "/template/Monash_University_logo_page.svg",
    height: 2em,
    ),
  footer: none,  // Footer removed
  navigation: "mini-slides",
  // logo: image("your-logo.svg", height: 2em),  // Uncomment and add your SVG logo path here
  config-info(
    title: [Monash University Presentation Template],
    subtitle: [Enhanced with Official Brand Guidelines],
    author: [Your Name],
    date: datetime.today(),
    institution: [Monash University],
  ),
)

#title-slide()

#outline-slide()

= Introduction

== Welcome to Monash

This presentation template has been enhanced with:

- *Official Monash University colors* including Monash Blue (\#006DAE)
- *Helvetica Neue typography* as per brand guidelines  
- *Professional layouts* suitable for academic presentations
- *Accessible color combinations* meeting WCAG standards

#v(1em)

#note[This template follows Monash University's official brand guidelines for consistent professional appearance.]

== Color Palette

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

= Advanced Features

== Typography & Styling

The template now uses modern fonts as per Monash brand guidelines:

=== Heading Levels
- *Level 1 headings* use Monash Blue
- *Level 2 headings* use Secondary Blue  
- *Level 3 headings* use Dark Grey

Regular text includes:
- *Bold text* in Monash Blue
- _Italic text_ in Secondary Blue
- Standard paragraph text in black

=== Box Environments

The template provides easy-to-use box environments:

```typst
#note[Your note content here]
#info[Additional information]
#warning[Important warnings]
#tip[Helpful tips]
```

== Content Examples

Here are various content types with enhanced Monash styling:

#alert[This is an alert message using Monash Blue]

*Box environments for different purposes:*

#note[Use this for general notes and important information that users should remember.]

#info[This provides additional context and details about the current topic being discussed.]

#warning[Critical information that requires immediate attention or could cause issues if ignored.]

#tip[Helpful suggestions and best practices to improve user experience and results.]

*Lists work beautifully:*
1. Numbered lists use consistent spacing
2. Colors follow Monash brand guidelines  
3. Typography is clean and readable

*Bullet points:*
- Enhanced readability
- Professional appearance
- Consistent with brand guidelines

== Data & Tables

Professional table styling with Monash colors:

#let table1 = table(
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

#figure(table1, caption: "A Table")

#v(1em)

#figure(
  monash-three-line-table[
    | *Name* | *Location* | *Height* | *Score* |
    | :----: | :--------: | :------: | :-----: |
    | John   | Second St. | 180 cm   | 5       |
    | Wally  | Third Av.  | 160 cm   | 10      |
  ],
  caption: "Three-line Monash table",
)

#v(1em)

#figure(
  monash-table[
    | *Col A* | *Col B* |
    | ------- | ------- |
    | a       | b       |
    | c       | d       |
  ],
  caption: "Striped Monash table",
)

#v(1em)

#figure(
  monash-three-line-table(
    stroke-color: rgb("#006dae"),
    header-fill: rgb("#EAF2F5"),
    stripe: true,
    stripe-fill: rgb("#F4F8FB"),
    top-stroke: .9pt,
    mid-stroke: .5pt,
    bottom-stroke: .9pt,
  )[
    | A | B | C |
    |:-:|:-:|:-:|
    | x | y | < |
    | ^ | z | z |
  ],
  caption: "Cell merging (<, ^) and customized strokes/fills",
)

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
  logo: image("your-logo.svg", height: 2em)
)
```


= Conclusion

== Summary

This enhanced Monash template includes:

#grid(
  columns: 2,
  gutter: 2em,
  [
    *Brand Compliance:*
    - Official Monash colors
    - Professional layouts
    - Accessible design
  ],
  [
    *New Features:*
    - Enhanced standard slides
    - Better typography
    - Clean design
    - Better section dividers
  ]
)

#v(1em)

Perfect for academic presentations, research talks, and professional meetings.

== Thank You!

*Questions & Discussion*
