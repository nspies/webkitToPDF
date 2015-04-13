# webkitToPDF

Converts a URL (file or web page) to PDF using WebKit (built in to OS X). Works well for automated SVG to PDF conversion. Based on [wkpdf](https://github.com/plessl/wkpdf).

Command-line arguments are (1) input URL (web page or file path) and (2) output file path, eg:

`webkitToPDF ~/artwork.svg artwork.pdf`

## Installation

To install, download the latest binary file from the [releases](https://github.com/nspies/webkitToPDF/releases/latest) page, and move the application into your PATH. For example, after downloading and unzipping the archive, use the following command to install the program:

```cd webkitToPDF
sudo mv webkitToPDF /usr/bin```
