### Claude Prompt: Monash University Typst (Touying) Presentation Template

Use this prompt to generate, extend, or refactor Typst slide decks built on the Monash-enhanced Touying `dewdrop` theme in this repo.

---

You are assisting with a Typst presentation using the Monash University Touying theme.

use * * for bold text, _ _ for italics, and ` ` for code inline snippets.

Produce working Typst code that:
- Imports and uses this template’s theme and helpers
- Respects Monash brand styling (colors, typography, layout)
- Uses best practices for tables, figures, and slide structure

When making changes, provide full Typst blocks that can be pasted into `template/main.typ` or new files as requested.

---

#### Defaults
- Import the theme and helpers:
  ```typst
  #import "dewdrop.typ": *
  #show: dewdrop-theme.with(
    aspect-ratio: "16-9",
    navigation: "mini-slides", // or "sidebar"
    footer: none,
    logo: image("Monash_University_logo_page.svg", height: 2em), // optional
    config-info(
      title: [Your Presentation Title],
      subtitle: [Subtitle],
      author: [Your Name],
      date: datetime.today(),
      institution: [Monash University],
    ),
  )
  ```
- Keep headings concise; use level-1/2/3 consistently.
- Prefer Monash-provided helpers: `note`, `info`, `warning`, `tip`.
- When writing literal hex colors in text (not in `rgb("...")`), escape `#` as `\#` (e.g., `\#006DAE`).

---

#### Slides
- Title slide:
  ```typst
  #title-slide()
  ```
- Outline slide:
  ```typst
  #outline-slide()
  ```
- Standard content slide:
  ```typst
  #slide[
    == Slide Title
    Your content here…
  ]
  ```

---

#### Tables (Monash-styled, via tablem)
- Use helpers and always wrap tables in `figure` with a caption.
- Choose one:
  - Three-line academic style: `monash-three-line-table`
  - Striped body style: `monash-table`

Basic three-line table:
```typst
#figure(
  monash-three-line-table[
    | *Name* | *Location* | *Height* | *Score* |
    | :----: | :--------: | :------: | :-----: |
    | John   | Second St. | 180 cm   | 5       |
    | Wally  | Third Av.  | 160 cm   | 10      |
  ],
  caption: "Three-line Monash table",
)
```

Striped table:
```typst
#figure(
  monash-table[
    | *Col A* | *Col B* |
    | ------- | ------- |
    | a       | b       |
    | c       | d       |
  ],
  caption: "Striped Monash table",
)
```

Cell merging and customization:
```typst
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
```

Reference for table parsing and alignment: `typst-tablem` [GitHub repository](https://github.com/OrangeX4/typst-tablem)

---

#### Figures & Images
```typst
#figure(
  image("figures/diagram.svg", width: 80%),
  caption: "System architecture overview",
)
```

---

#### Boxes and Alerts
```typst
#note-box[
  Put contents here
]
#tip-box[Each process has its own separate memory space and file descriptor table.]

#warning-box[Key reasons for non-deterministic behavior:]
```

---

#### Patterns to follow
- Group related content into separate `#slide[...]` blocks.
- Use concise captions with `#figure(...)`.
- Prefer `monash-three-line-table` for results tables; `monash-table` for simple listings.
- Keep slide text scannable: bullets over paragraphs; highlight sparingly.

#### Patterns to avoid
- Long walls of text; split across multiple slides.
- Uncaptioned images or tables.
- Hex colors in plain text without escaping the `#`.

---

#### Request templates
- “Create a title slide with title X, subtitle Y, author Z.”
- “Add a section called ‘Results’ with two slides: one bullet list, one three-line table using this data: …”
- “Insert a striped table summarizing A vs B with columns … and caption …”
- “Add an image at `figures/foo.svg` scaled to 70% with caption …”

---

If asked to modify existing slides, output only the minimal Typst edits needed (don’t reprint the whole file unless necessary). Use the helpers already provided by `dewdrop.typ`. 