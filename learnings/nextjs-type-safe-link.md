# Next.js statically typed links

[Next.js](https://beta.nextjs.org/docs/configuring/typescript#statically-typed-links) statically types links to avoid errors when using `next/link`. The type declarations are generated by the dev/build process and includes information of all valid routes in the application.

```tsx
import type { Route } from 'next';
import Link from 'next/link'

// ✅
<Link href="/about" />
// ✅
<Link href="/blog/nextjs" />
// ✅
<Link href={`/blog/${slug}`} />
// ✅
<Link href={('/blog' + slug) as Route} />

// ❌ TypeScript errors if href is not a valid route
<Link href="/aboot" />
```

