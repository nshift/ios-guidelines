# iOS Guidelines

These guidelines are based on the team's researches and own experience. This document intends to provide the best tools possible for building a great iOS project.


## Table of Contents

* [ADR](#adr)
	* [What is an ADR](#what-is-an-adr)
* [Domain Driven Design](#domain-driven-design)
  * [Align you project and domain](#align-your-project-and-domain)
  

## ADR

### What is an ADR

An architectural decision (AD) is a software design choice that addresses a 
significant requirement. An architecturally significant requirement (ASR) is a 
requirement that has a measurable effect on a software system’s architecture.

The goal is to keep track of the decisions and help the new contributors to 
quickly be up to date regarding the latest decisions.

#### File Name Convention

We prefer to use a file name convention that has a specific format:

* The name has the date as `YYYY-MM-DD`. This is ISO standard and helps for sorting
by date.
* The name has a present tense imperative verb phrase. This helps readability 
and matches our commit message format.
* The name uses sentence capitalization and spaces. This is helpful for readability.
* The extension is markdown. This can be useful for easy formatting.

**Preferred:**
```
2018-01-01 Choose a database.md
2018-01-02 Handle more users.md
2018-01-03 Improve application security.md
```

**Not Preferred:**
```
New database structure.md
2018-01-02 How we handle more users.md
2018-01-03 Improve application security.txt
```

#### Structure Of The Document

The structure of the document should be very simple:

* **Title**: short present tense imperative phrase, less than 50 characters, 
like a git commit message.
* **Context**: what is the issue that we're seeing that is motivating this 
decision or change.
* **Decision**: what is the change that we're actually proposing or doing.
* **Consequences**: what becomes easier or more difficult to do because of this 
change.

The Decision section is the most important section of the document. It will 
describe **why**, **how** and **what** the dicision is about. It should contain
examples and sample code.

**Example**:
```markdown
# Choose An Architecture

This document intends to record an architectural decision that addresses a significant 
requirement. It has been written by Damien Fraud on July 19th, 2018.

## Context

To implement properly MyProject, we will use a Clean Architecture. Our goal is to implement an architecture
that is maintainable, testable, scalable and evolvable.

It will help us to avoid Massive View Controllers  and be able to ship frequently with a high 
standard code quality.

Architecture should solve a particular design problem and be clear by its organisation.

What we are doing in the project should be explicit.

## Decision

We will use some of the MVVM pattern, follow SOLID principles and organize our code by isolating
features.

### SOLID

Following SOLID principles will help the team to build classes that are more reusable, 
maintainable and testable.

The two principles that must be followed at any cost should be:

- *Single Responsibility*: Classes should have only one single responsibility.
- *Dependency Inversion*:  High-level modules should not depend on low-level modules. Both should depend on abstractions. Abstractions should not depend on details. Details should depend on abstractions.

Prefered:

\```swift
class MyProjectAPI {
    var network: MyProjectNetworkInterface
    
    init(network: MyProjectNetworkInterface) {
        self.network = network
    }
    
    func searchArtist(artistName: String, completion: @escaping ((Result<[Artist]>) -> Void)) {
        self.network.searchArtists(artistName: artistName)   { [weak self] result in

        }
    }
}
\```

Not Prefered:

\```swift
class MyProjectAPI {
    func searchArtist(artistName: String, completion: @escaping ((Result<[Artist]>) -> Void)) {
        Alamofire.request().responseString {
            
        }
    }
}
\```

It will help the team to have the same approach when creating classes and standardize the code.

### Scalability

Architecture is not just about how to implement a particular design pattern, it is also about how
code is organized in the project's folder.

In order to reach scalability, features should be independent from each others. Adding 
more features should not impact other features. Each feature should be stored into a related 
domain folder. This pattern is described as micro features.

Prefered:

\```
MyProject
    -- ArtistSearch
        -- ArtistSearchViewController.swift
        -- ArtistSearchViewBoundaries.swift
        -- ArtistSearchPresenter.swift
        -- ArtistSearchCollectionViewCell.swift
    -- AlbumPlay
        -- AlbumPlayViewController.swift
        -- AlbumPlayViewBoundaries.swift
        -- AlbumPlayPresenter.swift
        -- AlbumPlayTableViewCell.swift
\```

Not Prefered:

\```
MyProject
    -- ViewControllers
        -- AlbumPlayViewController.swift
        -- ArtistSearchViewController.swift
    -- Cells
        -- ArtistSearchCollectionViewCell.swift
        -- AlbumPlayTableViewCell.swift
\```

It will help developers to quickly identify a specific feature and  define feature boundaries.


## Consequences

* A better collaboration between the contriubutors
* Easier to maintain
* An organization by features
* Being able to scale by adding more features without pain
```

## Domain Driven Design

### Align your project and domain

We consider that your Domain model should always be reflected in your code. This translates, in part, in the way that you organize your project.
In Domain Driven Design it is strongly advised to deploy your modules according to domain elements, not depending on technical layers. It helps in terms of scalability, maintainablity, but also in understanding your project. There is only so much the human brain can make up for and it is difficult to understand what you are working on if your domain element is separated accross modules. You should follow this rule when organizing your project.

#### Example

Features should be independent from each others. 
Adding more features should not impact other features. Each feature should be 
stored into a related domain folder. This pattern is described as micro features.

**Prefered:**

```
MyTune
    -- User
        -- Authenticate
            -- User Interface
            -- Business Logic
    -- Playlist
        -- List
            -- User Interface
            -- Business Logic
        -- Read
            -- User Interface
            -- Business Logic
    -- Tracks
        -- List
            -- User Interface
            -- Business Logic
```

**Not Prefered:**

```
MyTune
    -- ViewControllers
        -- UserAuthenticationViewControllers.swift
        -- UserPlaylistViewControllers.swift
        -- PlaylistInformationViewControllers.swift
        -- PlaylistTracksViewControllers.swift
    -- ViewModels
        -- UserAuthenticationViewModels.swift
        -- UserPlaylistViewModels.swift
        -- PlaylistInformationViewModels.swift
        -- PlaylistTracksViewModels.swift
```

It will help developers to quickly identify a specific feature and  define 
feature boundaries. Those features can also be delivered as separate modules.
