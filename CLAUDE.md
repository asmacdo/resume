# Resume Project

Austin Macdonald's resume, maintained as LaTeX.

## Building

Use `make` for iterating during development:
```bash
conda activate stamped
make
```

For final builds, use `datalad run` to record provenance:
```bash
conda activate stamped
datalad run -m "Build resume PDF from LaTeX source" --output resume.pdf "tectonic resume.tex"
```

To recreate the conda environment:
```bash
conda create -n stamped -c conda-forge --no-default-packages tectonic datalad
```

Output: `resume.pdf`

## Files

- `resume.tex` — source of truth, builds the PDF
- `Makefile` — builds resume.pdf via tectonic
- `context-heavy-agent-evaluation-mechababs.md` — AI workflow evaluation used to inform the AI skills description

## How Austin works

Austin is a research software engineer who came to software through music. Not casually: he has a performance degree and a music education degree, played professionally with regional symphonies and Broadway tours, taught at the college level, and built French horns. That background shapes everything: he thinks in terms of pedagogy, assessment, scaffolding, and knowing when to intervene vs let things run. This applies to how he mentors, how he designs systems, and how he works with AI.

**Honesty over flattery.** Every claim on this resume was stress-tested. He dropped Go from his languages because he couldn't write a struct from memory. He removed DANDI Archive because his contributions were minimal. He refused "AI-augmented workflows" as a descriptor because it overstated his actual practice. If he can't defend it in an interview, it doesn't go on the page.

**Architecture is a core value.** He cares deeply about getting the structure right and gets frustrated when forced to bolt things together without time to think. He'll kill a working implementation if the complexity doesn't match the problem. In one session he scrapped a full Python CLI package three times until it was one script and a bash wrapper.

**Simplicity through iteration.** He doesn't design up front and build to spec. He explores, hits walls, changes direction, and lets the design emerge. The result is usually radically simpler than where he started.

**Upstream-first.** He'd rather contribute a fix to the source project than build a workaround. He treats gaps in upstream tools as contributions to make, not problems to own.

**Open source as a practice, not a label.** He pushed ReproNim away from Squarespace toward a GitHub-based workflow. He facilitated CNCF governance transitions. He builds tools that enable community contribution by default.

**AI as a collaborator, not a generator.** He uses AI in two distinct modes: as a design partner for architecture and planning (hands-on, high-judgment), and as autonomous agents for well-scoped implementation work. The key skill is knowing which mode fits the problem. He's not interested in AI that writes code he doesn't understand.

## Editing principles

- **Honest signal only.** Don't add skills, projects, or claims Austin can't back up. If unsure, ask.
- **Austin must understand every line.** Don't make changes without discussion. Propose, don't implement.
- **Tone:** Professional but human. "Plot Twists" is intentional. The resume should feel like a person, not a template.
- **One em dash is plenty.**
- **Keep CLAUDE.md current.** When anything changes (build process, new projects, changed skills, corrected claims, workflow decisions), update this file immediately. Don't wait to be asked.
