# Monash University Touying Presentation Template

An enhanced version of the Touying Dewdrop theme customized with Monash University's official brand guidelines, colors, and typography.

## Features

### 🎨 Official Monash University Branding
- **Monash Blue (#006DAE)** as primary color
- **Complete color palette** including secondary blue, red accent, purple, and fuchsia
- **Helvetica Neue typography** as specified in brand guidelines
- **Professional layouts** suitable for academic presentations

### 🌈 Color Palette

| Color | Hex Code | Usage |
|-------|----------|-------|
| Monash Blue | #006DAE | Primary headings, focus slides |
| Secondary Blue | #00739D | Secondary headings, info boxes |
| Monash Red | #DF0021 | Alerts, warnings, highlights |
| Purple | #6F64A9 | Accent color |
| Fuchsia | #C90095 | Accent color |
| Dark Grey | #3C3C3C | Body text |
| Light Grey | #F8F9FA | Background elements |

### 📄 Slide Types

1. **Standard Slide** - Default content slides with Monash styling
2. **Title Slide** - Enhanced with Monash brand colors and clean layout
3. **Outline Slide** - Professional table of contents
4. **Section Slides** - Full-screen section dividers with Monash Blue background

### ✨ Enhanced Features

- **Improved typography** with modern sans-serif fonts
- **Better text hierarchy** with color-coded heading levels
- **Professional tables** with Monash brand styling
- **Enhanced code blocks** with syntax highlighting
- **Accessible color combinations** meeting WCAG guidelines
- **Clean footer** - no distracting page numbers
- **Logo support** - add SVG logo in top-right corner
- **Box environments** - easy-to-use colored boxes for notes, warnings, tips

## Usage

```typst
#import "dewdrop.typ": *

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  navigation: "mini-slides", // or "sidebar"
  footer: none, // Clean footer with no text
  logo: image("your-logo.svg", height: 2em), // Optional logo
  config-info(
    title: [Your Presentation Title],
    subtitle: [Subtitle],
    author: [Your Name],
    date: datetime.today(),
    institution: [Monash University],
  ),
)

#title-slide()

#outline-slide()

= Section 1

== Your Content

#slide[
  == Slide Title
  Your content here...
]
```

## Logo Support

To add a logo in the top-right corner:

```typst
#show: dewdrop-theme.with(
  // ... other parameters
  logo: image("your-logo.svg", height: 2em),
  // Or use text as logo:
  // logo: text(size: 1.5em, fill: blue, weight: "bold", "LOGO"),
)
```

The logo will appear on all slides automatically.

## Box Environments

The template provides easy-to-use box environments for different types of content:

```typst
#note[General notes and important information]

#info[Additional context and details]

#warning[Critical warnings and alerts]

#tip[Helpful suggestions and best practices]
```

Each box features:
- **Clear labels** with icons (📝 NOTE, ℹ️ INFO, ⚠️ WARNING, 💡 TIP)
- **Distinct colors** - Note (Monash Blue), Info (Cyan), Warning (Red), Tip (Purple)
- **Professional styling** with left border and colored background
- **Easy syntax** - just use `#boxtype[content]`
- **Responsive design** that works with the slide layout

## Tables

Monash-styled tables are powered by the tablem package, so you can paste Markdown-like tables directly, with automatic header detection, alignment, and cell merging. Helpers:
- `monash-three-line-table`: three-line academic style (top/header/bottom rules) in Monash colors
- `monash-table`: clean striped table with Monash defaults

Note: These helpers are already available when you import the theme as `*`.

### Basic three-line table
```typst
#slide[
  #monash-three-line-table[
    | *Name* | *Location* | *Height* | *Score* |
    | :----: | :--------: | :------: | :-----: |
    | John   | Second St. | 180 cm   | 5       |
    | Wally  | Third Av.  | 160 cm   | 10      |
  ]
]
```

### Striped table (paste Markdown)
```typst
#monash-table[
  | *Col A* | *Col B* |
  | ------- | ------- |
  | a       | b       |
  | c       | d       |
]
```

### Cell merging (horizontal <, vertical ^)
```typst
#monash-three-line-table[
  | A | B | C |
  |:-:|:-:|:-:|
  | x | y | < |
  | ^ | z | z |
]
```

### Customize Monash styling
```typst
#monash-three-line-table(
  stroke-color: rgb("#006dae"), // rules color (Monash Blue)
  header-fill: rgb("#EAF2F5"),  // header row fill
  stripe: true,
  stripe-fill: rgb("#F4F8FB"),  // body striping
  top-stroke: .9pt,
  mid-stroke: .5pt,
  bottom-stroke: .9pt,
)[
  | *A* | *B* |
  | --- | --- |
  | 1   | 2   |
  | 3   | 4   |
]
```

## Typography Hierarchy

- **Level 1 Headings**: Monash Blue, bold, 1.4em
- **Level 2 Headings**: Secondary Blue, bold, 1.2em  
- **Level 3 Headings**: Dark Grey, bold, 1.1em
- **Bold Text**: Monash Blue
- **Italic Text**: Secondary Blue
- **Body Text**: Black with Helvetica Neue

## Brand Compliance

This template follows Monash University's official brand guidelines:

- Uses approved color palette
- Implements Helvetica Neue typography
- Maintains proper color contrast ratios
- Follows clean, modern design principles
- Suitable for official university presentations

## Requirements

- Typst with Touying package
- Helvetica Neue font (falls back gracefully if not available)

## File Structure

```
template/
├── dewdrop.typ     # Enhanced theme file
├── main.typ        # Example presentation
├── main.pdf        # Compiled example
└── README.md       # This documentation
```

## Credits

- Original Dewdrop theme by [OrangeX4](https://github.com/OrangeX4)
- Inspired by [BeamerTheme](https://github.com/zbowang/BeamerTheme)
- Enhanced with Monash University brand guidelines
- Built with [Touying](https://github.com/touying-typ/touying)

## License

See LICENSE file for details.
