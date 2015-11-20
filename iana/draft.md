---
title: Initial Assignment for a Content Security Policy Directive Registry
abbrev: webappsec-csp-reg
docname: draft-west-webappsec-csp-reg-04
date: 2015
category: info

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
    target: https://www.w3.org/TR/CSP2
    title: Content Security Policy Level 2
    author:
    -
      ins: M. West
      name: Mike West
      organization: Google, Inc.
    -
      ins: A. Barth
      name: Adam Barth
      organization: Google, Inc.
    -
      ins: D. Veditz
      name: Dan Veditz
      organization: Mozilla
  RFC5226:
  RFC5234:

informative:
  RFC5341:

--- abstract

This document establishes an Internet Assigned Number Authority (IANA) registry
for Content Security Policy directives, and populates that registry with the
directives defined in the Content Security Policy Level 2 specification.

--- middle

# Introduction

The Content Security Policy specification {{CSP}} defines a mechanism by which
web developers can control the resources which a particular page can fetch or
execute, as well as a number of security-relevant policy decisions.

The policy language specified in that document consists of an extensible set
of "directives", each of which controls a specific resource type or policy
decision. This specification establishes a registry to ensure that extensions
to CSP are listed and standardized.

# Use of the Registry

Content Security Policy directives must be documented in a readily available
public specification in order to be registered by IANA. This documentation must
fully explain the syntax, intended usage, and semantics of the directive. The
intent of this requirement is to assure interoperable independent
implementations, and to prevent accidental namespace collisions between
implementations of dissimilar features.

Documents defining new Content Security Policy directives must register them
with IANA, as described in Section 3. The IANA registration policy for such
parameters is "Specification Required" {{RFC5226}}, and is further discussed
in Section 3.2.

# IANA Considerations

This specification creates a new top-level IANA registry named "Content Security
Policy directives".

## Content Security Policy directives Registry

New Content Security Policy directives, and updates to existing directives, must
be registered with IANA.

When registering a new Content Security Policy directive, the following
information must be provided:

* The directive's name, an ASCII string conforming to the `directive-name`
  rule specified in Section 4.1 of {{CSP}}. The ABNF {{RFC5234}} is as follows:

      directive-name  = 1*( ALPHA / DIGIT / "-" )

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

The registration policy for Content Security Policy directives is "Specification
Required" {{RFC5226}}, which uses a designated expert to review the
specification.

When appointing an Expert (or Experts), the IESG SHOULD draw from the W3C's
security community, coordinating through the liaison.

The designated expert, when deliberating on whether to include a new directive
in the registry, should consider the following criteria. This is not an
exhaustive list, but representative of the issues to consider when rendering a
decision:

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
registering new directives must contain detailed security and privacy
considerations sections, and should contain usage information which informs web
developers as to the directive's expected implementation.

--- back

# Acknowledgements

Much of this document's structure comes from {{RFC5341}}. Thank you to Cullen
Jennings and Vijay K. Gurbani for giving me a reasonable template to work
within, and to Barry Leiba for his helpful commentary and suggestions.
