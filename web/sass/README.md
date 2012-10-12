Hello, front-end developer!

This Symfony standard project has all the Foundation 3.1 files (SASS/JS/images/etc) already installed. To use Compass and Foundation correctly, however, you will need those already installed on your computer.

We've overriden _settings.scss and app.scss to include multiple breakpoints. This required copying a chunk of code from Foundation's semantic grid and importing it within each @media query. Why? Because SASS is weird, and that's just what we had to do.

If you ever need to update Foundation and it tries to blow away any of these files, you can reference the _bck/ folder to see how it was originally intented to work.

Good luck and God speed.