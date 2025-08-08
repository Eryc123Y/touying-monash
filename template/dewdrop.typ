// This theme is inspired by https://github.com/zbowang/BeamerTheme
// The typst version was written by https://github.com/OrangeX4
// Enhanced with Monash University brand guidelines and color scheme

#import "@preview/touying:0.6.1": *

#let _typst-builtin-repeat = repeat

// Monash brand fonts with fallbacks for better compatibility
#let monash-font = ("Liberation Sans", "DejaVu Sans", "Noto Sans")

#let dewdrop-header(self) = {
  if self.store.navigation == "sidebar" {
    place(
      right + top,
      {
        v(4em)
        show: block.with(width: self.store.sidebar.width, inset: (x: 1em))
        set align(left)
        set par(justify: false)
        set text(size: .9em)
        components.custom-progressive-outline(
          self: self,
          level: auto,
          alpha: self.store.alpha,
          text-fill: (self.colors.primary, self.colors.neutral-darkest),
          text-size: (1em, .9em),
          vspace: (-.2em,),
          indent: (0em, self.store.sidebar.at("indent", default: .5em)),
          fill: (self.store.sidebar.at("fill", default: _typst-builtin-repeat[.]),),
          filled: (self.store.sidebar.at("filled", default: false),),
          paged: (self.store.sidebar.at("paged", default: false),),
          short-heading: self.store.sidebar.at("short-heading", default: true),
        )
      },
    )
  } else if self.store.navigation == "mini-slides" {
    components.mini-slides(
      self: self,
      fill: self.colors.primary,
      alpha: self.store.alpha,
      display-section: self.store.mini-slides.at("display-section", default: false),
      display-subsection: self.store.mini-slides.at("display-subsection", default: true),
      linebreaks: self.store.mini-slides.at("linebreaks", default: true),
      short-heading: self.store.mini-slides.at("short-heading", default: true),
    )
  }
}

#let dewdrop-footer(self) = {
  set align(bottom)
  set text(size: 0.8em)
  show: pad.with(.5em)
  components.left-and-right(
    text(fill: self.colors.neutral-darkest.lighten(40%), utils.call-or-display(self, self.store.footer)),
    text(fill: self.colors.neutral-darkest.lighten(20%), utils.call-or-display(self, self.store.footer-right)),
  )
}

/// Default slide function for the presentation.
///
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For more several configurations, you can use `utils.merge-dicts` to merge them.
///
/// - repeat (int, auto): The number of subslides. Default is `auto`, which means touying will automatically calculate the number of subslides.
///
///   The `repeat` argument is necessary when you use `#slide(repeat: 3, self => [ .. ])` style code to create a slide. The callback-style `uncover` and `only` cannot be detected by touying automatically.
///
/// - setting (function): The setting of the slide. You can use it to add some set/show rules for the slide.
///
/// - composer (function, array): The composer of the slide. You can use it to set the layout of the slide.
///
///   For example, `#slide(composer: (1fr, 2fr, 1fr))[A][B][C]` to split the slide into three parts. The first and the last parts will take 1/4 of the slide, and the second part will take 1/2 of the slide.
///
///   If you pass a non-function value like `(1fr, 2fr, 1fr)`, it will be assumed to be the first argument of the `components.side-by-side` function.
///
///   The `components.side-by-side` function is a simple wrapper of the `grid` function. It means you can use the `grid.cell(colspan: 2, ..)` to make the cell take 2 columns.
///
///   For example, `#slide(composer: 2)[A][B][#grid.cell(colspan: 2)[Footer]]` will make the `Footer` cell take 2 columns.
///
///   If you want to customize the composer, you can pass a function to the `composer` argument. The function should receive the contents of the slide and return the content of the slide, like `#slide(composer: grid.with(columns: 2))[A][B]`.
///
/// - bodies (array): The contents of the slide. You can call the `slide` function with syntax like `#slide[A][B][C]` to create a slide.
#let slide(
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  let self = utils.merge-dicts(
    self,
    config-page(
      header: dewdrop-header,
      footer: dewdrop-footer,
    ),
    config-common(subslide-preamble: self.store.subslide-preamble),
  )
  touying-slide(self: self, config: config, repeat: repeat, setting: setting, composer: composer, ..bodies)
})


/// Title slide for the presentation. You should update the information in the `config-info` function. You can also pass the information directly to the `title-slide` function.
///
/// Example:
///
/// ```typst
/// #show: dewdrop-theme.with(
///   config-info(
///     title: [Title],
///     logo: emoji.city,
///   ),
/// )
///
/// #title-slide(subtitle: [Subtitle], extra: [Extra information])
/// ```
///
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For more several configurations, you can use `utils.merge-dicts` to merge them.
/// 
/// - extra (string, none): The extra information you want to display on the title slide.
#let title-slide(
  config: (:),
  extra: none,
  ..args,
) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config,
    config-common(freeze-slide-counter: true),
    config-page(margin: 0em),
  )
  let info = self.info + args.named()
  let body = {
    set text(fill: self.colors.neutral-darkest, font: monash-font)
    set align(center + horizon)
    
    // Monash-style title slide with brand colors
    block(
      width: 100%,
      inset: 2em,
      {
        // Main title block with Monash branding
        block(
          fill: self.colors.primary,
          inset: 2em,
          width: 100%,
          radius: 0em, // Clean, modern look
          [
            #set text(fill: self.colors.neutral-lightest, weight: "bold")
            #text(size: 1.5em, info.title)
            #if info.subtitle != none {
              linebreak()
              v(0.5em)
              text(size: 1.1em, weight: "regular", info.subtitle)
            }
          ],
        )
        
        v(1.5em)
        
        // Author and institution block
        block(
          fill: self.colors.neutral-light,
          inset: 1.5em,
          width: 100%,
          radius: 0em,
          [
            #set text(fill: self.colors.neutral-darkest, size: 1em)
            #if info.author != none {
              text(weight: "medium", info.author)
              if info.institution != none or extra != none or info.date != none {
                linebreak()
              }
            }
            #if info.institution != none {
              v(0.3em)
              text(size: 0.9em, weight: "regular", info.institution)
              if extra != none or info.date != none {
                linebreak()
              }
            }
            #if extra != none {
              v(0.3em)
              text(size: 0.9em, weight: "regular", extra)
              if info.date != none {
                linebreak()
              }
            }
            #if info.date != none {
              v(0.3em)
              text(size: 0.9em, fill: self.colors.neutral-dark, utils.display-info-date(self))
            }
          ],
        )
      },
    )
  }
  touying-slide(self: self, body)
})


/// Outline slide for the presentation.
/// 
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For more several configurations, you can use `utils.merge-dicts` to merge them.
/// 
/// - title (string): The title of the slide. Default is `utils.i18n-outline-title`.
#let outline-slide(config: (:), title: utils.i18n-outline-title, ..args) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      footer: dewdrop-footer,
    ),
  )
  touying-slide(
    self: self,
    config: config,
    components.adaptive-columns(
      start: text(
        1.2em,
        fill: self.colors.primary,
        weight: "bold",
        utils.call-or-display(self, title),
      ),
      text(
        fill: self.colors.neutral-darkest,
        outline(title: none, indent: 1em, depth: self.slide-level, ..args),
      ),
    ),
  )
})


/// New section slide for the presentation with enhanced Monash styling. You can update it by updating the `new-section-slide-fn` argument for `config-common` function.
///
/// Example: `config-common(new-section-slide-fn: new-section-slide.with(numbered: false))`
/// 
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For more several configurations, you can use `utils.merge-dicts` to merge them.
///
/// - title (string): The title of the slide. Default is `utils.i18n-outline-title`.
///
/// - body (array): The contents of the slide.
#let new-section-slide(config: (:), title: utils.i18n-outline-title, ..args, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      footer: dewdrop-footer,
      fill: self.colors.primary,
    ),
  )
  touying-slide(
    self: self,
    config: config,
    align(center + horizon, [
      #set text(fill: self.colors.neutral-lightest, font: monash-font)
      #block(
        width: 80%,
        [
          #text(
            size: 2em,
            weight: "bold",
            utils.call-or-display(self, title),
          )
          #v(1em)
          #line(length: 100%, stroke: 2pt + self.colors.neutral-lightest)
          #v(1em)
          #text(
            size: 1.1em,
            weight: "regular",
            body
          )
        ]
      )
    ])
  )
})


/// Focus on some content with Monash branding.
///
/// Example: `#focus-slide[Wake up!]`
/// 
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For more several configurations, you can use `utils.merge-dicts` to merge them.
#let focus-slide(config: (:), body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(fill: self.colors.primary, margin: 2em),
  )
  set text(fill: self.colors.neutral-lightest, size: 1.8em, font: monash-font, weight: "bold")
  touying-slide(self: self, config: config, align(horizon + center, body))
})


/// Create a slide with Monash-branded info box
/// 
/// Example: `#info-slide[This is important information]`
/// 
/// - config (dictionary): The configuration of the slide.
#let info-slide(config: (:), body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: dewdrop-header,
      footer: dewdrop-footer,
    ),
  )
  let content = align(center + horizon, [
    #block(
      width: 85%,
      fill: self.colors.secondary.lighten(95%),
      stroke: (left: 4pt + self.colors.secondary, rest: 1pt + self.colors.secondary.lighten(70%)),
      inset: 2em,
      radius: 3pt,
      [
        #set text(fill: self.colors.neutral-darkest, font: monash-font)
        #text(size: 1.2em, weight: "medium", body)
      ]
    )
  ])
  touying-slide(self: self, config: config, content)
})


/// Create a slide for highlighting key points with Monash accent color
/// 
/// Example: `#highlight-slide[Key Takeaway]`
/// 
/// - config (dictionary): The configuration of the slide.
#let highlight-slide(config: (:), body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(fill: self.colors.accent, margin: 2em),
  )
  set text(fill: self.colors.neutral-lightest, size: 1.6em, font: monash-font, weight: "bold")
  let content = align(center + horizon, [
    #block(
      width: 90%,
      inset: 1.5em,
      stroke: 3pt + self.colors.neutral-lightest,
      radius: 5pt,
      body
    )
  ])
  touying-slide(self: self, config: config, content)
})


/// Touying dewdrop theme enhanced with Monash University branding.
///
/// This theme incorporates Monash University's official color palette, typography (Helvetica Neue),
/// and design principles for professional presentations.
///
/// Example:
///
/// ```typst
/// #show: dewdrop-theme.with(
///   aspect-ratio: "16-9", 
///   config-colors(primary: rgb("#006dae")) // Monash Blue
/// )
/// ```
///
/// The official Monash colors included:
///
/// ```typ
/// config-colors(
///   neutral-darkest: rgb("#000000"),      // Monash Black
///   neutral-dark: rgb("#3c3c3c"),         // Monash Dark Grey  
///   neutral-light: rgb("#f8f9fa"),        // Light Grey
///   neutral-lightest: rgb("#ffffff"),     // Monash White
///   primary: rgb("#006dae"),              // Monash Blue
///   secondary: rgb("#00739d"),            // Secondary Blue
///   accent: rgb("#df0021"),               // Monash Red
///   purple: rgb("#6f64a9"),               // Monash Purple
///   fuchsia: rgb("#c90095"),              // Monash Fuchsia
/// )
/// ```
///
/// - aspect-ratio (string): The aspect ratio of the slides. Default is `16-9`.
///
/// - navigation (string): The navigation of the slides. You can choose from `"sidebar"`, `"mini-slides"`, and `none`. Default is `"sidebar"`.
///
/// - sidebar (dictionary): The configuration of the sidebar. You can set the width, filled, numbered, indent, and short-heading of the sidebar. Default is `(width: 10em, filled: false, numbered: false, indent: .5em, short-heading: true)`.
///   - width (string): The width of the sidebar.
///   - filled (boolean): Whether the outline in the sidebar is filled.
///   - numbered (boolean): Whether the outline in the sidebar is numbered.
///   - indent (length): The indent of the outline in the sidebar.
///   - short-heading (boolean): Whether the outline in the sidebar is short.
///
/// - mini-slides (dictionary): The configuration of the mini-slides. You can set the height, x, display-section, display-subsection, and short-heading of the mini-slides. Default is `(height: 4em, x: 2em, display-section: false, display-subsection: true, linebreaks: false, short-heading: true)`.
///   - height (length): The height of the mini-slides.
///   - x (length): The x position of the mini-slides.
///   - display-section (boolean): Whether the slides of sections are displayed in the mini-slides.
///   - display-subsection (boolean): Whether the slides of subsections are displayed in the mini-slides.
///   - linebreaks (boolean): Whether line breaks are in between links for sections and subsections in the mini-slides.
///   - short-heading (boolean): Whether the mini-slides are short. Default is `true`.
///
/// - footer (content, function): The footer of the slides. Default is `none`.
///
/// - footer-right (content, function): The right part of the footer. Default is `context utils.slide-counter.display() + " / " + utils.last-slide-number`.
///
/// - primary (color): The primary color of the slides. Default is `rgb("#006DAE")`.
///
/// - alpha (fraction, float): The alpha of transparency. Default is `60%`.
///
/// - outline-title (content, function): The title of the outline. Default is `utils.i18n-outline-title`.
///
/// - subslide-preamble (content, function): The preamble of the subslide. Default is `self => block(text(1.2em, weight: "bold", fill: self.colors.primary, utils.display-current-heading(depth: self.slide-level)))`.
#let dewdrop-theme(
  aspect-ratio: "16-9",
  navigation: "sidebar",
  sidebar: (
    width: 10em,
    filled: false,
    numbered: false,
    indent: .5em,
    short-heading: true,
  ),
  mini-slides: (
    height: 4em,
    x: 2em,
    display-section: false,
    display-subsection: true,
    linebreaks: false,  // Changed to false for horizontal layout
    short-heading: true,
  ),
  footer: none,
  footer-right: context utils.slide-counter.display() + " / " + utils.last-slide-number,
  primary: rgb("#006dae"),
  alpha: 60%,
  subslide-preamble: self => block(
    text(1.2em, weight: "bold", fill: self.colors.primary, utils.display-current-heading(depth: self.slide-level, style: auto)),
  ),
  ..args,
  body,
) = {
  sidebar = utils.merge-dicts(
    (width: 10em, filled: false, numbered: false, indent: .5em, short-heading: true),
    sidebar,
  )
  mini-slides = utils.merge-dicts(
    (height: 4em, x: 2em, display-section: false, display-subsection: true, linebreaks: false, short-heading: true),
    mini-slides,
  )
  set text(size: 20pt, font: monash-font)
  set par(justify: true, leading: 0.65em)
  set heading(numbering: none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 0em,
      footer-descent: 0em,
      margin: if navigation == "sidebar" {
        (top: 2em, bottom: 1em, x: sidebar.width)
      } else if navigation == "mini-slides" {
        (top: mini-slides.height, bottom: 2em, x: mini-slides.x)
      } else {
        (top: 2em, bottom: 2em, x: mini-slides.x)
      },
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      init: (self: none, body) => {
        // Monash-style heading formatting
        show heading.where(level: 1): set text(
          size: 1.4em, 
          weight: "bold", 
          fill: self.colors.primary,
          font: monash-font
        )
        show heading.where(level: 2): set text(
          size: 1.2em, 
          weight: "bold", 
          fill: self.colors.secondary,
          font: monash-font
        )
        show heading.where(level: 3): set text(
          size: 1.1em, 
          weight: "bold", 
          fill: self.colors.neutral-dark,
          font: monash-font
        )
        
        // Enhanced text styling
        show strong: set text(weight: "bold", fill: self.colors.primary)
        show emph: set text(style: "italic", fill: self.colors.secondary)
        
        body
      },
      alert: utils.alert-with-primary-color,
      // Add Monash-style info boxes
      info-box: (self: none, body) => {
        block(
          fill: self.colors.secondary.lighten(90%),
          stroke: (left: 3pt + self.colors.secondary),
          inset: 1em,
          radius: 2pt,
          body
        )
      },
      warning-box: (self: none, body) => {
        block(
          fill: self.colors.accent.lighten(90%),
          stroke: (left: 3pt + self.colors.accent),
          inset: 1em,
          radius: 2pt,
          body
        )
      },
    ),
    config-colors(
      neutral-darkest: rgb("#000000"),      // Monash Black
      neutral-dark: rgb("#3c3c3c"),         // Monash Dark Grey  
      neutral-light: rgb("#f8f9fa"),        // Light Grey for backgrounds
      neutral-lightest: rgb("#ffffff"),     // Monash White
      primary: rgb("#006dae"),              // Monash Blue (primary)
      secondary: rgb("#00739d"),            // Monash Secondary Blue
      accent: rgb("#df0021"),               // Monash Red for highlights
      purple: rgb("#6f64a9"),               // Monash Purple
      fuchsia: rgb("#c90095"),              // Monash Fuchsia
    ),
    // save the variables for later use
    config-store(
      navigation: navigation,
      sidebar: sidebar,
      mini-slides: mini-slides,
      footer: footer,
      footer-right: footer-right,
      alpha: alpha,
      subslide-preamble: subslide-preamble,
    ),
    ..args,
  )

  body
}