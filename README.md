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
5. **Focus Slide** - Emphasis slides with large text on Monash Blue background
6. **Info Slide** - Information boxes with secondary blue styling
7. **Highlight Slide** - Important announcements with Monash Red background

### ✨ Enhanced Features

- **Improved typography** with Helvetica Neue throughout
- **Better text hierarchy** with color-coded heading levels
- **Professional tables** with Monash brand styling
- **Enhanced code blocks** with syntax highlighting
- **Accessible color combinations** meeting WCAG guidelines
- **Info and warning boxes** using brand colors

## Usage

```typst
#import "@preview/touying:0.6.1": *
#import themes.dewdrop: *

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  navigation: "mini-slides", // or "sidebar"
  config-info(
    title: [Your Presentation Title],
    subtitle: [Subtitle],
    author: [Your Name],
    date: datetime.today(),
    institution: [Monash University],
  ),
)

#title-slide(extra: [Your Department/Faculty])

#outline-slide()

= Section 1

== Your Content

#slide[
  == Slide Title
  Your content here...
]

// Use special slide types
#info-slide[Important information]
#focus-slide[Key Message]
#highlight-slide[Critical Announcement]
```

## Special Slide Functions

### Info Slide
```typst
#info-slide[
  This creates an information box with secondary blue styling
]
```

### Focus Slide
```typst
#focus-slide[
  Large text on Monash Blue background for emphasis
]
```

### Highlight Slide
```typst
#highlight-slide[
  Important announcements with Monash Red background
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
