---
title: Content Security Policy Directive Registry
abbrev: webappsec-csp-reg
docname: draft-west-webappsec-csp-reg-00
date: 2015
category: std

ipr: trust200902
area: General
keyword: Internet-Draft

pi: [toc, tocindent, sortrefs, symrefs, strict, compact, comments, inline]

author:
-
  ins: M. West
  name: Mike West
  organization: Google, Inc
  email: mkwst@google.com
  uri: https://mikewest.org/

normative:
  CSP:
    target: https://w3c.github.io/webappsec-csp/
    title: Content Security Policy
    author:
    -
      ins: M. West
      name: Mike West
      organization: Google, Inc.
    -
      ins: D. Veditz
      name: Dan Veditz
      organization: Mozilla
  RFC2119:
  RFC5226:

informative:
  RFC5341:

--- abstract

This document establishes an Internet Assigned Number Authority (IANA) registry
for Content Security Policy directives. It populates the registry with the
directives defined in the CSP specification.

--- middle

# Introduction

The Content Security Policy specification {{CSP}} defines a mechanism by which
web developers can control the resources which a particular page can fetch or
execute, as well as a number of security-relevant policy decisions.

The policy language specified in that document consists of an extensible set
of "directives", each of which controls a specific resource type or policy
decision. This specification establishes a registry to ensure that extensions
to CSP are listed and standardized.

# Terminology

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD",
"SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be
interpreted as described in {{RFC2119}}.

# Use of the Registry

Content Security Policy directives MUST be documented in a readily available
public specification in order to be registered by IANA. This documentation MUST
fully explain the syntax, intended usage, and semantics of the directive. The
intent of this requirement is to assure interoperable independent
implementations, and to prevent accidental namespace collisions between
implementations of dissimilar features.

Documents defining new Content Security Policy directives MUST register them
with IANA, as described in Section 4. The IANA registration policy for such
parameters is "Specification Required, Designated Expert", and is further
discussed in Section 4.2.

# IANA Considerations

This specification creates a new IANA registry named "Content Security Policy
directives".

## Content Security Policy directives Registry

New Content Security Policy directives, and updates to existing directives, MUST
be registered with IANA.

When registering a new Content Security Policy directive, the following
information MUST be provided:

* The directive's name (which MUST be an ASCII string)
* A reference to the readily available public specification defining the new
  directive's syntax, usage, and semantics.

The following table contains the initial values for this registry:

| Directive Name  | Reference |
| base-uri        | {{CSP}}   |
| child-src       | {{CSP}}   |
| connect-src     | {{CSP}}   |
| default-src     | {{CSP}}   |
| font-src        | {{CSP}}   |
| form-action     | {{CSP}}   |
| frame-ancestors | {{CSP}}   |
| frame-src       | {{CSP}}   |
| img-src         | {{CSP}}   |
| media-src       | {{CSP}}   |
| object-src      | {{CSP}}   |
| plugin-types    | {{CSP}}   |
| report-uri      | {{CSP}}   |
| sandbox         | {{CSP}}   |
| script-src      | {{CSP}}   |
| style-src       | {{CSP}}   |

## Registration Policy for Content Security Policy directives

As per the terminology in {{RFC5226}} and actions accorded to such a role, the
registration policy for Content Security Policy directives is "Specification
Required, Designated Expert" (the former implies the latter).

The Designated Expert, when deliberating on whether to include a new directive
in the registry, MAY use the criteria provided below to reach a decision. These
are not an exhaustive list, but representative of the issues to consider when
rendering an equitable decision):

* Content Security Policy is a restrictive feature, which allows web developers
  to deny themselves access to resources and APIs which would otherwise be
  available. Deploying Content Security Policy is, therefore, a strict reduction
  in risk. The expert should carefully consider whether proposed directives
  would violate this property.

* Granular directives are valuable, but the expert should strive to strike a
  reasonable balance between providing developers with all the knobs and
  switches possible, and providing only those with known security implications.

# Security Considerations

The registry in this document does not in itself have security implications. The
directives specified, however, certainly do. The documents referenced when
registering new directives MUST contain detailed security and privacy
considerations sections, and SHOULD contain usage information which informs web
developers as to the directive's expected implementation.

--- back

# Acknowledgements

I've cargo-culted this document from {{RFC5341}}, so thank you to Cullen
Jennings and Vijay K. Gurbani for giving me a reasonable template to work
within.
