<?xml version="1.0" encoding="UTF-8" ?>
<!--


   XSL Style Sheet
   Author: Jeff Brown
   Date:   11/02/20

   Filename:         FINAL_PROJECT.xsl
   Supporting Files: FINAL_PROJECT.css

-->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"
    doctype-system="about:legacy-compat"
    encoding="UTF-8"
    indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>books</title>
                <link href="FINAL_PROJECT.css" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <header>
                    <section>
                        Last Updated:
                        <xsl:value-of select="books/date" />
                        at
                        <xsl:value-of select="books/time" />
                    </section>
                    <h1>My Book Shelf</h1>
                </header>
                <section>
                    <h1>Science Fiction</h1>
                    <xsl:apply-templates
                        select="books/book[genre='Science Fiction']">
                        <xsl:sort select="sName" />
                    </xsl:apply-templates>
                </section>

                <section>
                    <h1>Horror</h1>
                    <xsl:apply-templates
                        select="books/book[genre='Horror']">
                        <xsl:sort select="sName" />
                    </xsl:apply-templates>
                </section>

                <section>
                    <h1>Fantasy</h1>
                    <xsl:apply-templates
                        select="books/book[genre='Fantasy']">
                        <xsl:sort select="sName" />
                    </xsl:apply-templates>
                </section>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">
        <article>
            <h1>
                <xsl:value-of select="sName" />
            </h1>
            <xsl:apply-templates select="today" />
            <img src="{sName/@symbol}.jpg" alt="3 month history" />
            <p>
                <xsl:value-of select="description" />
            </p>
            <hr />
        </article>
    </xsl:template>
    <xsl:template match="today">
        <table>
            <thead>
                <tr>
                    <th colspan="2">Book Ratings</th>
                </tr>
                <tr>
                    <th>Goodreads</th>
                    <th>Mine</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <xsl:apply-templates select="@goodreads" />
                    <xsl:apply-templates select="@mine" />
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="@goodreads|@mine">
        <td><xsl:value-of select="." /></td>
    </xsl:template>

</xsl:stylesheet>