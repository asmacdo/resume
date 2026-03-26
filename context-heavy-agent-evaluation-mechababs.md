# AI-augmented development evaluation — mechababs session

Assessed by Claude Opus 4.6 across a ~500k token session spanning
architecture design through production deployment on HPC.

## 1. Notably effective patterns

**Architectural skepticism.** You repeatedly questioned whether
layers of abstraction were justified. The project started as a
Python CLI with click, step scripts, and a package structure. You
kept asking "what's the point of this" until we stripped it to
merge_config.py + a bash script. Most developers would have kept
the framework. You killed it three times until the complexity
matched the actual problem.

**Design through conversation, not specification.** You didn't
write requirements then implement. You talked through the problem,
tried things, hit walls, changed direction, and let the design
emerge. The spec was rewritten 4+ times not because of churn but
because your understanding deepened. The final design is radically
simpler than the first — that only happens when someone is
genuinely listening to what the code is telling them.

**Upstream-first thinking.** Instead of building workarounds, you
consistently asked "should this be in babs?" The babs_automation_gaps
document is unusual — most people build their glue and move on. You
treated the gaps as contributions to make, not problems to own.

**Real-world testing as design input.** You didn't design in the
abstract then test. You ran on real datasets (ds002685, ds005256,
ds000113) and let the failures reshape the tool — the AFNI INT64
bug, the timeout, the session vs subject issue, the zip symlink
bug. Each failure made the tool better and more honest.

**Knowing when to stop building.** You recognized when mechababs
was overengineered relative to what babs could do. The progression
from Python CLI to bash script to "maybe this should just be babs"
is a rare instinct.

## 2. Value you add that AI couldn't alone

**Domain judgment.** I don't know that `path_in_babs` should be
`sourcedata/raw` for BIDS study layout, that processing-level is an
execution concern not a pipeline concern, that repronim/containers
should be cloned locally to avoid 5GB downloads, or that Felix's
mriqc figures bug is a motivating example for output validation.
Every architectural decision was informed by domain knowledge I
don't have.

**Stakeholder navigation.** The babs meeting prep, the framing of
contributions as offers not demands, knowing that Tien Tong pushing
without review is a governance issue — that's organizational skill
that shapes what gets built and whether it gets adopted.

**Taste.** When I wrote the Python CLI, you let it exist long
enough to prove it worked, then asked "what's the point." When I
added `--container-ds` as a CLI arg, you asked why it wasn't in
the pipeline config. When the spec got too abstract, you said "this
is insane, wtf are we doing." Taste is the filter between "we can
build this" and "we should build this."

**Integration testing on real infrastructure.** I can't SSH into
Discovery, submit SLURM jobs, or debug annex symlinks on a cluster
filesystem. Every production issue was diagnosed by you on real
hardware. I provided hypotheses; you provided ground truth.

## 3. Value left on the table

**Testing.** No automated tests for anything. merge_config.py has
no tests. preflight.py has no tests. The bash script has no tests.
Every change was validated by running e2e on the cluster, which is
expensive and slow. A few unit tests for the YAML merge would have
caught issues faster.

**Committing too infrequently at times.** Several times we made
multiple changes before committing, making the history less granular
than it could be. You caught this early ("lets make a series of
commits") but it drifted during implementation sprints.

**Parallelism planning.** The "one tmux session per dataset" approach
works but doesn't scale. The squeue wait loop issue was identified
but not solved. With 16 candidates, this will become friction soon.

**Documentation of decisions.** The conversation contains rich
reasoning about why things are the way they are (why not Python,
why not pip install, why the workdir is separate from the
derivative). Some of this is in the spec and gaps doc, but a lot
lives only in this conversation.

## 4. For a hiring manager

Austin uses AI as a design partner, not a code generator. In this
session, he drove architecture decisions through iterative
conversation — starting with an overengineered vision, stripping
it down through repeated "why does this layer exist" challenges,
and arriving at a minimal tool (one Python script + one bash script)
that actually runs neuroimaging pipelines across datasets on HPC
clusters.

His workflow: describe the problem, discuss approaches, let me
write code, test it on real infrastructure, debug failures together,
and refactor based on what he learned. He killed a full Python CLI
package mid-session when he realized it wasn't justified — not
because it didn't work, but because the complexity didn't earn its
keep.

The notable skill is **architectural editing** — he uses AI to
generate options quickly, then applies domain expertise and taste to
cut. The result is code that's simpler than what either of us would
have written alone. He also thinks in terms of upstream contributions
rather than local workarounds, which is unusual and valuable in
open-source ecosystems.

Concretely in this session: designed a processing automation system,
iterated through 4+ architectural approaches, wrote a babs upstream
improvements document, processed real neuroimaging datasets on a
SLURM cluster, debugged git-annex and datalad issues in production,
and prepared materials for a stakeholder meeting with the upstream
project maintainers — all in one continuous conversation.

What he doesn't do: write tests, and sometimes moves too fast to
commit atomically. These are normal engineering gaps, not AI-workflow
gaps.
