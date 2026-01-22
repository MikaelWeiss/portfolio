---
name: strive-design
description: Design philosophy and UI/UX guidelines for Strive. Use this skill whenever building, modifying, or reviewing any user interface element — views, components, layouts, animations, or interactions. Applies to any change that affects what users see or how they interact with the app.
---

# Strive Design

Strive helps users tame a busy day and build a meaningful life. The interface should feel like a calm, focused space — a quiet room, not a busy street.

## Design Philosophy

### Core Principles

**Simplicity through removal.** If in doubt, leave it out. Every element must earn its place. The best interface is the one that disappears, letting users focus on what matters.

**Form follows function.** Design decisions flow from purpose. Decoration without meaning is noise.

**Precision and intentionality.** Every pixel matters. Alignment, spacing, and proportion should feel inevitable, not arbitrary.

**Quiet confidence.** The UI should never scream for attention. Confidence is expressed through restraint, not volume.

**Generous whitespace.** Space is not empty — it's breathing room. Let elements exist without crowding.

**Depth through subtlety.** Use shadows, materials, and layering with a light touch. Depth should guide attention, not distract.

**Consistency across the system.** Patterns should be predictable. Users should never wonder "how does this work here?"

**Delight in small details.** Haptics, micro-animations, and thoughtful transitions reward attention without demanding it.

### Strive's Personality

- **Calm over urgent.** Even when showing important information, maintain composure.
- **Focused over comprehensive.** Show what matters now, not everything at once.
- **Minimal over decorated.** Clean lines, purposeful color, no ornament for its own sake.
- **Meaningful over busy.** Every interaction should feel intentional and worthwhile.

## Anti-Patterns to Avoid

### Visual Clutter
- Cluttered screens with competing calls-to-action
- Inconsistent spacing or alignment
- Too many font weights or sizes on one screen
- Borders and dividers where whitespace would suffice

### Generic "AI Slop"
- Predictable layouts that look auto-generated
- Overused patterns: purple/blue gradients, glassmorphism everywhere, generic card grids
- Decoration that adds complexity without meaning
- Animations that exist to impress rather than inform

### Anti-Calm Patterns
- Gratuitous animations or transitions
- Aggressive color usage or high-contrast alerts for non-critical information
- Dense information displays that overwhelm
- UI elements competing for attention

### Implementation Smells
- Custom components when native SwiftUI provides the same function
- Inconsistent use of system colors or typography
- Hardcoded values instead of semantic spacing/colors
- Skeuomorphic elements that don't serve understanding

## SwiftUI Implementation

### Prefer Native Components
Use SwiftUI's built-in components whenever possible. They're accessible, consistent, and feel at home on iOS. Custom components should only exist when native ones genuinely can't serve the need.

### Navigation
Use standard SwiftUI navigation patterns:
- `NavigationStack` for hierarchical navigation
- `TabView` for top-level app sections
- System navigation bars — never custom implementations

### Iconography
SF Symbols are the primary icon source. They:
- Scale perfectly with Dynamic Type
- Adapt to system appearance
- Feel native to iOS
- Support accessibility out of the box

Use semantic symbol variants (`.fill`, `.circle`, etc.) consistently.

### Spacing and Layout
Use consistent, semantic spacing. Prefer SwiftUI's built-in spacing and padding over hardcoded values. When custom values are needed, use multiples of 4pt for visual rhythm.

### Color
- Use semantic colors (`Color.primary`, `Color.secondary`, etc.) as the foundation
- Accent colors should be used sparingly — for primary actions and key information
- Support both light and dark mode from the start
- Test colors for accessibility contrast ratios

### Typography
Rely on the system font (SF Pro) and Dynamic Type. Use semantic text styles (`.headline`, `.body`, `.caption`, etc.) rather than fixed sizes.

### Animation
Animations should be:
- Quick and responsive (under 300ms for most interactions)
- Purposeful — guiding attention or confirming actions
- Subtle — users should feel them more than see them
- Interruptible when possible

Use SwiftUI's built-in animation curves. Avoid spring animations with excessive bounce.

## Human Interface Guidelines

When designing or implementing UI, consult Apple's Human Interface Guidelines for:
- Platform conventions and patterns
- Accessibility requirements
- Component-specific guidance
- System integration (widgets, notifications, etc.)

Fetch relevant HIG documentation using Context7:
```
Library ID: /websites/developer_apple_design_human-interface-guidelines
```

Query specific topics as needed — don't load everything at once. Examples:
- "navigation patterns iOS"
- "buttons and controls"
- "typography and fonts"
- "color and materials"
- "motion and animation"

The HIG is a baseline, not a ceiling. Follow its conventions, but don't be afraid to express Strive's calm, focused personality within those constraints.
