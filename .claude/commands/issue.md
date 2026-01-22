# Create Linear Issue

You are creating a Linear issue based on the user's description. Follow this process carefully.

## Input
The user has provided the following issue description:
$ARGUMENTS

## Process

### Step 1: Understand the Issue
Read the description carefully. If it's unclear or ambiguous, ask clarifying questions before proceeding.

### Step 2: Search for Duplicates and Related Issues
Use the Linear MCP tools to search for:
1. **Duplicates**: Issues that describe the same problem or would be solved by the same fix
2. **Related issues**: Issues that are connected to this problem

Search using relevant keywords from the description. Be thorough.

### Step 3: Search the Codebase
Use Grep and Glob to find:
- Related files that would need to be modified
- Similar existing features
- Relevant data models and classes

**IMPORTANT**: Never include actual code in the issue. Only include:
- File paths
- Class/model names
- Brief descriptions of what exists

### Step 4: Handle Existing Features
If the functionality described in the issue **already exists** in the codebase:
1. Tell the user the feature already exists and briefly explain where/how
2. **Stop here** - do not create an issue, add comments, or ask questions
3. The process is complete

### Step 5: Ask Clarifying Questions (if needed)
After searching, if you discover:
- The description is ambiguous given what you found
- There are multiple ways to interpret the issue
- You need more context to write a good spec

Then ask the user for clarification before proceeding.

### Step 6: Handle Duplicates
If you find a duplicate issue:
1. Tell the user you found a duplicate and link to it
2. Add a comment to the existing issue with any new/additional information from the user's description
3. Report back to the user what you did
4. **Do not create a new issue**

### Step 7: Determine Issue Metadata
Figure out the following by analyzing the issue:

**Label** (choose one):
- `Bug` - Something is broken or not working as expected
- `Feature` - New functionality that doesn't exist
- `Improvement` - Enhancement to existing functionality

**Priority** (1-4):
- 1 = Urgent (blocking, critical bug)
- 2 = High (important, affects core functionality)
- 3 = Normal (standard priority)
- 4 = Low (nice to have, minor)

**Estimate** (story points, if the team uses them):
- Discover the team's estimate scale using Linear MCP
- Assign an appropriate estimate based on complexity

### Step 8: Prepare the Issue Summary
Create a summary with ALL of the following sections:

**Title**: Clear, concise title (action-oriented)

**Description**:
- Brief explanation of the issue
- Link to any related Linear issues
- List of related files (NO CODE)
- Relevant data models/classes involved

**Spec** (Given/When/Then format):
```
Given: [precondition/context]
When: [action/trigger]
Then: [expected outcome]
```
Include multiple Given/When/Then blocks if needed. NO implementation details here.

**Implementation Details**:
- Technical approach to solve this
- Files that need to be modified
- Key considerations
- Edge cases to handle

**Metadata**:
- Label: [chosen label]
- Priority: [chosen priority]
- Estimate: [if applicable]
- Related Issues: [list any that should be linked]

### Step 9: Create the Issue
Create the issue immediately:
1. Create the issue using Linear MCP with all the metadata
2. Link related issues using Linear's relation system (if supported)
3. Report back the issue ID/URL to the user

## Important Guidelines

- **SIMPLE**: Issues should be laser-focused and as simple as possible
- **COMPLETE**: Include all relevant information, even if it makes the issue longer
- **NO CODE**: Never include code snippets in the issue, only file paths and class names
- **CLARIFY**: When in doubt, ask the user
- **AUTO-CREATE**: Create the issue immediately without asking for approval
