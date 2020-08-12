<!doctype html>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    >

    <!-- Bootstrap CSS -->
    <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
            integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
            crossorigin="anonymous"
    >

    <title>Welcome</title>
</head>
<body>
<%
    if (session.getAttribute("user_first_name") == null) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/");
        requestDispatcher.forward(request, response);
    }
%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a
            class="navbar-brand"
            href="#"
    >World Navigator</a>
    <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
    >
        <span class="navbar-toggler-icon"></span>
    </button>
    <div
            class="collapse navbar-collapse"
            id="navbarNav"
    >
        <ul class="navbar-nav">
            <li class="nav-item active"><a
                    class="nav-link"
                    href="${pageContext.request.contextPath}/"
            >Home</a></li>
            <li class="nav-item"><a
                    class="nav-link"
                    href="${pageContext.request.contextPath}/Game/GameMenu"
            >Game</a></li>

            <li class="nav-item active"><a
                    class="btn btn-primary"
                    href="javascript:alert('Hello!');"
                    role="button"
                    style="margin-left: 20px"
            >User : <%=session.getAttribute("user_first_name")%>
            </a></li>

            <li class="nav-item active"><a
                    class="btn btn-primary"
                    href="javascript:alert('You can get more wins!');"
                    role="button"
                    style="margin-left: 20px"
            >You have : <%=session.getAttribute("user_wins")%> win/s</a></li>

            <li class="nav-item active"><a
                    class="btn btn-danger"
                    href="${pageContext.request.contextPath}/Logout"
                    role="button"
                    style="margin-left: 20px"
            >Logout</a></li>
        </ul>
    </div>
</nav>


<div class="container-sm">

    <div
            class="container-sm"
            style="margin-top: 110px"
    >

        <style>
            /* https://github.com/microsoft/vscode/blob/master/extensions/markdown-language-features/media/markdown.css */
            /*---------------------------------------------------------------------------------------------
             *  Copyright (c) Microsoft Corporation. All rights reserved.
             *  Licensed under the MIT License. See License.txt in the project root for license information.
             *--------------------------------------------------------------------------------------------*/

            body {
                font-family: var(--vscode-markdown-font-family, -apple-system, BlinkMacSystemFont, "Segoe WPC", "Segoe UI", "Ubuntu", "Droid Sans", sans-serif);
                font-size: var(--vscode-markdown-font-size, 14px);
                padding: 0 26px;
                line-height: var(--vscode-markdown-line-height, 22px);
                word-wrap: break-word;
            }

            #code-csp-warning {
                position: fixed;
                top: 0;
                right: 0;
                color: white;
                margin: 16px;
                text-align: center;
                font-size: 12px;
                font-family: sans-serif;
                background-color: #444444;
                cursor: pointer;
                padding: 6px;
                box-shadow: 1px 1px 1px rgba(0, 0, 0, .25);
            }

            #code-csp-warning:hover {
                text-decoration: none;
                background-color: #007acc;
                box-shadow: 2px 2px 2px rgba(0, 0, 0, .25);
            }

            body.scrollBeyondLastLine {
                margin-bottom: calc(100vh - 22px);
            }

            body.showEditorSelection .code-line {
                position: relative;
            }

            body.showEditorSelection .code-active-line:before,
            body.showEditorSelection .code-line:hover:before {
                content: "";
                display: block;
                position: absolute;
                top: 0;
                left: -12px;
                height: 100%;
            }

            body.showEditorSelection li.code-active-line:before,
            body.showEditorSelection li.code-line:hover:before {
                left: -30px;
            }

            .vscode-light.showEditorSelection .code-active-line:before {
                border-left: 3px solid rgba(0, 0, 0, 0.15);
            }

            .vscode-light.showEditorSelection .code-line:hover:before {
                border-left: 3px solid rgba(0, 0, 0, 0.40);
            }

            .vscode-light.showEditorSelection .code-line .code-line:hover:before {
                border-left: none;
            }

            .vscode-dark.showEditorSelection .code-active-line:before {
                border-left: 3px solid rgba(255, 255, 255, 0.4);
            }

            .vscode-dark.showEditorSelection .code-line:hover:before {
                border-left: 3px solid rgba(255, 255, 255, 0.60);
            }

            .vscode-dark.showEditorSelection .code-line .code-line:hover:before {
                border-left: none;
            }

            .vscode-high-contrast.showEditorSelection .code-active-line:before {
                border-left: 3px solid rgba(255, 160, 0, 0.7);
            }

            .vscode-high-contrast.showEditorSelection .code-line:hover:before {
                border-left: 3px solid rgba(255, 160, 0, 1);
            }

            .vscode-high-contrast.showEditorSelection .code-line .code-line:hover:before {
                border-left: none;
            }

            img {
                max-width: 100%;
                max-height: 100%;
            }

            a {
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }

            a:focus,
            input:focus,
            select:focus,
            textarea:focus {
                outline: 1px solid -webkit-focus-ring-color;
                outline-offset: -1px;
            }

            hr {
                border: 0;
                height: 2px;
                border-bottom: 2px solid;
            }

            h1 {
                padding-bottom: 0.3em;
                line-height: 1.2;
                border-bottom-width: 1px;
                border-bottom-style: solid;
            }

            h1, h2, h3 {
                font-weight: normal;
            }

            table {
                border-collapse: collapse;
            }

            table > thead > tr > th {
                text-align: left;
                border-bottom: 1px solid;
            }

            table > thead > tr > th,
            table > thead > tr > td,
            table > tbody > tr > th,
            table > tbody > tr > td {
                padding: 5px 10px;
            }

            table > tbody > tr + tr > td {
                border-top: 1px solid;
            }

            blockquote {
                margin: 0 7px 0 5px;
                padding: 0 16px 0 10px;
                border-left-width: 5px;
                border-left-style: solid;
            }

            code {
                font-family: Menlo, Monaco, Consolas, "Droid Sans Mono", "Courier New", monospace, "Droid Sans Fallback";
                font-size: 1em;
                line-height: 1.357em;
            }

            body.wordWrap pre {
                white-space: pre-wrap;
            }

            pre:not(.hljs),
            pre.hljs code > div {
                padding: 16px;
                border-radius: 3px;
                overflow: auto;
            }

            pre code {
                color: var(--vscode-editor-foreground);
                tab-size: 4;
            }

            /** Theming */

            .vscode-light pre {
                background-color: rgba(220, 220, 220, 0.4);
            }

            .vscode-dark pre {
                background-color: rgba(10, 10, 10, 0.4);
            }

            .vscode-high-contrast pre {
                background-color: rgb(0, 0, 0);
            }

            .vscode-high-contrast h1 {
                border-color: rgb(0, 0, 0);
            }

            .vscode-light table > thead > tr > th {
                border-color: rgba(0, 0, 0, 0.69);
            }

            .vscode-dark table > thead > tr > th {
                border-color: rgba(255, 255, 255, 0.69);
            }

            .vscode-light h1,
            .vscode-light hr,
            .vscode-light table > tbody > tr + tr > td {
                border-color: rgba(0, 0, 0, 0.18);
            }

            .vscode-dark h1,
            .vscode-dark hr,
            .vscode-dark table > tbody > tr + tr > td {
                border-color: rgba(255, 255, 255, 0.18);
            }

        </style>

        <style>
            /* Tomorrow Theme */
            /* http://jmblog.github.com/color-themes-for-google-code-highlightjs */
            /* Original theme - https://github.com/chriskempson/tomorrow-theme */

            /* Tomorrow Comment */
            .hljs-comment,
            .hljs-quote {
                color: #8e908c;
            }

            /* Tomorrow Red */
            .hljs-variable,
            .hljs-template-variable,
            .hljs-tag,
            .hljs-name,
            .hljs-selector-id,
            .hljs-selector-class,
            .hljs-regexp,
            .hljs-deletion {
                color: #c82829;
            }

            /* Tomorrow Orange */
            .hljs-number,
            .hljs-built_in,
            .hljs-builtin-name,
            .hljs-literal,
            .hljs-type,
            .hljs-params,
            .hljs-meta,
            .hljs-link {
                color: #f5871f;
            }

            /* Tomorrow Yellow */
            .hljs-attribute {
                color: #eab700;
            }

            /* Tomorrow Green */
            .hljs-string,
            .hljs-symbol,
            .hljs-bullet,
            .hljs-addition {
                color: #718c00;
            }

            /* Tomorrow Blue */
            .hljs-title,
            .hljs-section {
                color: #4271ae;
            }

            /* Tomorrow Purple */
            .hljs-keyword,
            .hljs-selector-tag {
                color: #8959a8;
            }

            .hljs {
                display: block;
                overflow-x: auto;
                color: #4d4d4c;
                padding: 0.5em;
            }

            .hljs-emphasis {
                font-style: italic;
            }

            .hljs-strong {
                font-weight: bold;
            }
        </style>

        <style>
            /*
             * Markdown PDF CSS
             */

            body {
                font-family: -apple-system, BlinkMacSystemFont, "Segoe WPC", "Segoe UI", "Ubuntu", "Droid Sans", sans-serif, "Meiryo";
                padding: 0 12px;
            }

            pre {
                background-color: #f8f8f8;
                border: 1px solid #cccccc;
                border-radius: 3px;
                overflow-x: auto;
                white-space: pre-wrap;
                overflow-wrap: break-word;
            }

            pre:not(.hljs) {
                padding: 23px;
                line-height: 19px;
            }

            blockquote {
                background: rgba(127, 127, 127, 0.1);
                border-color: rgba(0, 122, 204, 0.5);
            }

            .emoji {
                height: 1.4em;
            }

            code {
                font-size: 14px;
                line-height: 19px;
            }

            /* for inline code */
            :not(pre):not(.hljs) > code {
                color: #C9AE75; /* Change the old color so it seems less like an error */
                font-size: inherit;
            }

            /* Page Break : use <div class="page"/> to insert page break
            -------------------------------------------------------- */
            .page {
                page-break-after: always;
            }

        </style>

        <script src="https://unpkg.com/mermaid/dist/mermaid.min.js"></script>
        </head>
        <body>
        <script>
            mermaid.initialize({
                startOnLoad: true,
                theme: document.body.classList.contains('vscode-dark') || document.body.classList.contains('vscode-high-contrast')
                    ? 'dark'
                    : 'default'
            });
        </script>
        <h1 id="world-navigator-report">World Navigator Report</h1>
        <h3 id="summary"><strong>Summary</strong></h3>
        <p>This report is for World Navigator Game, created by <strong>Samer Rawashdeh</strong> as a solution for the
            Atypon's internship World Navigator assignment</p>
        <p>This report will show the knowledge and experience I gained so far from Atypon's internship.</p>
        <p>This version of the code, contains 50+ files with 2400+ source code lines.</p>
        <p>This report contains 5500+ words and it' takes about 15 minutes to read.</p>
        <h2 id="topics-covered"><strong>Topics Covered</strong></h2>
        <ol>
            <li>How my code satisfies the clean code principles according to Robert's "Clean Code" book</li>
            <li>How my code satisfies the effective Java code principles according to Joshua's "Effective Java" book
            </li>
            <li>Discuss the design patterns I used to implement my solutions and why</li>
            <li>How my code satisfies the SOLID principles?</li>
            <li>How my code satisfies Google (or Twitter) styling guide</li>
            <li>Concurrency issues in my code and how I dealt with it</li>
            <li>Data structures I used and why</li>
        </ol>
        <h2 id="how-my-code-satisfies-the-clean-code-principles-according-to-clean-code-book"><strong>How my code
            satisfies the clean code principles according to "Clean Code" book</strong></h2>
        <h3 id="chapter-2-meaningful-names">Chapter 2 <strong>Meaningful Names</strong> :</h3>
        <p>&quot;Choosing good names takes time but saves more than it takes.&quot;, I find this quote from Robert's
            Book very important every time I refactored my code, sometimes miss naming classes, variables or functions
            could complicate thigs more than it should be</p>
        <ul>
            <li>
                <h4 id="use-intention-revealing-names"><strong>USE INTENTION-REVEALING NAMES</strong></h4>
                <ul>
                    <li>
                        <p>Every part of my code satisfy this point, and I find it easy to achieve it, examples</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">private</span> Direction facingDirection;
<span class="hljs-keyword">private</span> Light heldLight;
<span class="hljs-keyword">private</span> Room currentRoom;
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">private</span> Room startRoom;
<span class="hljs-keyword">private</span> Room goalRoom;
<span class="hljs-keyword">private</span> <span class="hljs-keyword">int</span> timeToFinish;
<span class="hljs-keyword">private</span> <span class="hljs-keyword">int</span> initialGold;
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <h4 id="avoid-disinformation"><strong>AVOID DISINFORMATION</strong></h4>
                <ul>
                    <li>Satisfying this point was easy too, because World Navigator game is a simple game that doesn't
                        have complex names
                    </li>
                </ul>
            </li>
            <li>
                <h4 id="make-meaningful-distinctions"><strong>MAKE MEANINGFUL DISTINCTIONS</strong></h4>
                <ul>
                    <li>
                        <p>The first version of my code didn't satisfy this point, this book helped me spot the problem
                            and fix it</p>
                        <p>Before the fix :</p>
                        <pre class="hljs"><code><div>RoomObject trader0 = getPlayer().facingRoomObject();

<span class="hljs-keyword">if</span> (!(trader0 <span class="hljs-keyword">instanceof</span> Trader)) {
  System.out.println(<span class="hljs-string">"You are not facing a trader or a seller! selling is canceled..."</span>);
  <span class="hljs-keyword">return</span>;
}

Trader trader = (Trader) trader0;
</div></code></pre>
                        <p>After the fix</p>
                        <pre class="hljs"><code><div>RoomObject roomObject = getPlayer().facingRoomObject();

<span class="hljs-keyword">if</span> (!(roomObject <span class="hljs-keyword">instanceof</span> Trader)) {
  System.out.println(<span class="hljs-string">"You are not facing a trader or a seller! selling is canceled..."</span>);
  <span class="hljs-keyword">return</span>;
}

Trader trader = (Trader) roomObject;
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <h4 id="class-names"><strong>CLASS NAMES</strong></h4>
                <ul>
                    <li>&quot;Classes and objects should have noun or noun phrase names like <code>Customer</code>,
                        <code>WikiPage</code>, <code>Account</code>, and <code>AddressParser</code>. Avoid words like
                        <code>Manager</code>, <code>Processor</code>, <code>Data</code>, or <code>Info</code> in the
                        name of a class. A class name should not be a verb.&quot;
                    </li>
                    <li>My code fulfill this point very good, we can see it every where examples : <code>Key</code>,
                        <code>Lockable</code>, <code>LootHider</code>, <code>Painting</code> and more
                    </li>
                </ul>
            </li>
            <li>
                <h4 id="method-names"><strong>METHOD NAMES</strong></h4>
                <ul>
                    <li>&quot;Methods should have verb or verb phrase names like <code>postPayment</code>, <code>deletePage</code>&quot;
                    </li>
                    <li>Examples where my code complied with this point : <code>getGoldBalance</code>,
                        <code>giveItem</code>, <code>addItem</code>, <code>addDefaultCommands</code>,
                        <code>toggle</code></li>
                </ul>
            </li>
        </ul>
        <h3 id="chapter-3-functions">Chapter 3 <strong>Functions</strong>:</h3>
        <ul>
            <li>
                <h3 id="small"><strong>SMALL!</strong></h3>
                <ul>
                    <li>
                        <p>The first rule of functions is that they should be small, and the second rule is that they
                            should be smaller than that</p>
                        <p>Pascal said &quot;I am sorry this letter is so long, I didn't have time to make it smaller&quot;</p>
                        <p>making a small functions is not an easy task, but I think I did a good job regards to this
                            rule, examples :</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">holdLight</span><span
                                class="hljs-params">(Light light)</span> </span>{
  <span class="hljs-keyword">if</span> (light == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"light value is null!"</span>);
  }
  <span class="hljs-keyword">if</span> (heldLight!= <span class="hljs-keyword">null</span>) {
    giveItem(heldLight);
   }
    heldLight = light;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-meta">@Override</span>
<span class="hljs-function"><span class="hljs-keyword">public</span> Loot <span class="hljs-title">getLoot</span><span
        class="hljs-params">()</span> </span>{
  <span class="hljs-keyword">return</span> keyLoot;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">lootGold</span><span
                                class="hljs-params">(Player player)</span> </span>{
  <span class="hljs-keyword">if</span> (player == <span class="hljs-keyword">null</span>)
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"player value is null!"</span>);
  player.giveGold(goldLoot);
  System.out.println(goldLoot + <span class="hljs-string">" gold was acquired"</span>);
  goldLoot = <span class="hljs-number">0</span>;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">loot</span><span class="hljs-params">(Player player)</span> </span>{
  lootGold(player);
  lootItems(player);
}
</div></code></pre>
                    </li>
                </ul>
                <p>I had some difficulties applying this rule for all my code, since some of them need to have switch
                    statements and while loops, example :</p>
                <pre class="hljs"><code><div><span class="hljs-function"><span class="hljs-keyword">public</span> <span
                        class="hljs-keyword">static</span> Direction <span
                        class="hljs-title">oppositeDirection</span><span
                        class="hljs-params">(Direction direction)</span> </span>{
  <span class="hljs-keyword">if</span> (direction == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                            class="hljs-string">"direction value is null!"</span>);
  }

  <span class="hljs-keyword">switch</span> (direction) {
    <span class="hljs-keyword">case</span> NORTH:
      <span class="hljs-keyword">return</span> Direction.SOUTH;
    <span class="hljs-keyword">case</span> EAST:
      <span class="hljs-keyword">return</span> Direction.WEST;
    <span class="hljs-keyword">case</span> SOUTH:
      <span class="hljs-keyword">return</span> Direction.NORTH;
    <span class="hljs-keyword">default</span>: <span class="hljs-comment">// this default must be Direction.WEST</span>
      <span class="hljs-keyword">return</span> Direction.EAST;
  }

}
</div></code></pre>
            </li>
            <li>
                <h3 id="do-one-thing"><strong>DO ONE THING</strong></h3>
                <ul>
                    <li>
                        <p>This rule is well known, and it makes things easier while you advance in the code, it makes
                            functions smaller and easer to deal with, examples :</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">switchRoomLight</span><span class="hljs-params">()</span> </span>{
  <span class="hljs-keyword">if</span> (currentRoom.isLightSwitchAvailable()) {
    currentRoom.switchLightSwitch();
  } <span class="hljs-keyword">else</span> {
    System.out.println(<span class="hljs-string">"no light switch to switch"</span>);
  }
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">useHeldLight</span><span class="hljs-params">()</span> </span>{
  <span class="hljs-keyword">if</span> (heldLight == <span class="hljs-keyword">null</span>) {
    System.out.println(<span class="hljs-string">"I am not holding a light source to use it!"</span>);
  } <span class="hljs-keyword">else</span> {
    heldLight.toggle();
  }
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <h3 id="one-level-of-abstraction-per-function"><strong>ONE LEVEL OF ABSTRACTION PER FUNCTION</strong>
                </h3>
                <ul>
                    <li>
                        <h4 id="reading-code-from-top-to-bottom-the-stepdown-rule"><strong>Reading Code from Top to
                            Bottom: *The Stepdown Rule*</strong></h4>
                        <p>&quot;We want the code to read like a top-down narrative. We want every function to be
                            followed by those at the next level of abstraction so that we can read the program&quot;
                            Robert</p>
                        <p>I achieved this rule in many places in my code, I used <strong>Template Method Design
                            Pattern</strong>, we will talk about it later in details, example :</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">final</span> <span
                                class="hljs-keyword">void</span> <span class="hljs-title">sellItem</span><span
                                class="hljs-params">(Trader trader, Item item)</span> </span>{
  <span class="hljs-keyword">if</span> (trader == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"trader value is null!"</span>);
  }
  <span class="hljs-keyword">if</span> (item == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"item value is null!"</span>);
  }
  <span class="hljs-keyword">if</span> (!canSellItemTo(trader, item)) {
    cancelSelling();
    trader.cancelBuying();
    <span class="hljs-keyword">return</span>;
  }
  proceedSelling(item);
  trader.proceedBuying(item);
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <h3 id="use-descriptive-names"><strong>USE DESCRIPTIVE NAMES</strong></h3>
                <ul>
                    <li>
                        <p>&quot;A long descriptive name is better than a long descriptive comment&quot; Robert</p>
                        <p>my longest function name is <code> initialValuesToRestart()</code>, I did use a descriptive
                            names for my functions for other parts too</p>
                    </li>
                </ul>
            </li>
            <li>
                <p><strong>FUNCTION ARGUMENTS</strong></p>
                <ul>
                    <li>
                        <p>The maximum number of arguments in my functions is 2, most of my functions have zero or one
                            argument, some of them has 2 arguments but it's rare, although the 2 arguments are
                            acceptable by Robert's Book, examples :</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">addGold</span><span class="hljs-params">(<span class="hljs-keyword">int</span> goldLoot)</span> </span>{
  <span class="hljs-keyword">if</span> (goldLoot &lt; <span class="hljs-number">0</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> IllegalArgumentException(<span
                                    class="hljs-string">"gold amount is negative!"</span>);
  }

  <span class="hljs-keyword">this</span>.goldLoot += goldLoot;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">useKey</span><span class="hljs-params">(Key key)</span> </span>{
  <span class="hljs-keyword">if</span> (facingRoomObject() <span class="hljs-keyword">instanceof</span> Lockable) {
    useKey((Lockable) facingRoomObject(), key);
  } <span class="hljs-keyword">else</span> {
    System.out.println(<span class="hljs-string">"What you are facing doesn't need a key!"</span>);
  }
}

<span class="hljs-function"><span class="hljs-keyword">private</span> <span class="hljs-keyword">void</span> <span
        class="hljs-title">useKey</span><span class="hljs-params">(Lockable lockable, Key key)</span> </span>{

  <span class="hljs-keyword">if</span> (lockable == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"lockable value is null!"</span>);
  }

  <span class="hljs-keyword">if</span> (key == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"key value is null!"</span>);
  }

  lockable.useKey(key);
}
</div></code></pre>
                        <p>Technically, a constructor usually is a method, I have a constructor with more than 3
                            arguments, it's actually the <strong>Map</strong> class and it has 5 arguments , and I
                            solved that using **Builder Design Pattern **, more on that latter...</p>
                        <pre class="hljs"><code><div>  <span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-title">Map</span><span
                                class="hljs-params">(Room startRoom, Room goalRoom, <span
                                class="hljs-keyword">int</span> timeToFinish, <span class="hljs-keyword">int</span> initialGold,
    Direction playerFacingDirection)</span> </span>{...}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">MapBuilder</span> </span>{
  ...
  <span class="hljs-function"><span class="hljs-keyword">public</span> Map <span class="hljs-title">buildMap</span><span
          class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> <span class="hljs-keyword">new</span> Map(startRoom, goalRoom, timeToFinish, initialGold, playerFacingDirection);
  }
}
</div></code></pre>
                    </li>
                    <li>
                        <h4 id="flag-arguments"><strong>Flag Arguments</strong></h4>
                        <p>&quot;Flag arguments are ugly&quot; Robert, my code is free of boolean arguments, a good way
                            to solve boolean argument is to try and extract more functions from the function with
                            boolean arguments</p>
                    </li>
                </ul>
            </li>
        </ul>
        <h3 id="chapter-7-error-handling">Chapter 7 <strong>Error Handling</strong> :</h3>
        <ul>
            <li>
                <h3 id="use-exceptions-rather-than-return-codes"><strong>USE EXCEPTIONS RATHER THAN RETURN
                    CODES</strong></h3>
                <ul>
                    <li>
                        <p>&quot;it is better to throw an exception when you encounter an error. The calling code is
                            cleaner. Its logic is not obscured by error handling.&quot;, my code obey this rule so that
                            no unexpected action happen, every error must be handled and fixed and not ignored, example
                            :</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">final</span> <span
                                class="hljs-keyword">void</span> <span class="hljs-title">sellItem</span><span
                                class="hljs-params">(Trader trader, Item item)</span> </span>{
  <span class="hljs-keyword">if</span> (trader == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"trader value is null!"</span>);
  }
  <span class="hljs-keyword">if</span> (item == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"item value is null!"</span>);
  }
  <span class="hljs-keyword">if</span> (!canSellItemTo(trader, item)) {
    cancelSelling();
    trader.cancelBuying();
    <span class="hljs-keyword">return</span>;
  }
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <h3 id="dont-return-null"><strong>DON'T RETURN NULL</strong></h3>
                <ul>
                    <li>Not a single function in my code return null, and this could help so much in exception handling,
                        since as a function caller, I don't need to check if the return value of the called function is
                        null or not
                    </li>
                </ul>
            </li>
            <li>
                <h3 id="dont-pass-null"><strong>DON'T PASS NULL</strong></h3>
                <ul>
                    <li>
                        <p>In my early versions of my code, I used to do this, but after reading from this Book I
                            changed that</p>
                        <p>I used to do that in my constructors, but not any more, examples :</p>
                        <p>Before the fix :</p>
                        <p><em>Having this key variable equals null was part of my code logic, and it meant that
                            Painting doesn't hide a key</em></p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-title">Painting</span><span
                                class="hljs-params">(Key keyLoot)</span> </span>{
  <span class="hljs-keyword">this</span>.keyLoot = <span class="hljs-keyword">new</span> OneKeyLoot(keyLoot);
}
</div></code></pre>
                        <p>After the fix :</p>
                        <pre class="hljs"><code><div> <span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-title">Painting</span><span
                                class="hljs-params">()</span> </span>{
   keyLoot = <span class="hljs-keyword">new</span> OneKeyLoot();
 }
 <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-title">Painting</span><span
         class="hljs-params">(Key keyLoot)</span> </span>{

   <span class="hljs-keyword">if</span> (keyLoot == <span class="hljs-keyword">null</span>) {
     <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"key value is null!"</span>);
   }
   <span class="hljs-keyword">this</span>.keyLoot = <span class="hljs-keyword">new</span> OneKeyLoot(keyLoot);
 }
</div></code></pre>
                    </li>
                </ul>
            </li>
        </ul>
        <h2 id="how-my-code-satisfies-the-effective-java-code-principles-according-to-joshuas-effective-java-book">
            <strong>How my code satisfies the effective Java code principles according to Joshua's "Effective Java"
                book</strong></h2>
        <ul>
            <li>
                <p>Item 2 : <strong>Consider a builder when faced with many constructor parameters</strong></p>
                <ul>
                    <li>
                        <p>Map class used this Design Pattern, since to create a map you need 5 parameters, example
                            :</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">MapBuilder</span> </span>{
  <span class="hljs-keyword">private</span> Room startRoom;
  <span class="hljs-keyword">private</span> Room goalRoom;
  <span class="hljs-keyword">private</span> <span class="hljs-keyword">int</span> timeToFinish;
  <span class="hljs-keyword">private</span> <span class="hljs-keyword">int</span> initialGold;
  <span class="hljs-keyword">private</span> Direction playerFacingDirection;

  <span class="hljs-function"><span class="hljs-keyword">public</span> MapBuilder <span
          class="hljs-title">setStartRoom</span><span class="hljs-params">(Room startRoom)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> MapBuilder <span
          class="hljs-title">setGoalRoom</span><span class="hljs-params">(Room goalRoom)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> MapBuilder <span class="hljs-title">setTimeToFinish</span><span
          class="hljs-params">(<span class="hljs-keyword">int</span> timeToFinish)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> MapBuilder <span class="hljs-title">setInitialGold</span><span
          class="hljs-params">(<span class="hljs-keyword">int</span> initialGold)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> MapBuilder <span class="hljs-title">setPlayerFacingDirection</span><span
          class="hljs-params">(Direction playerFacingDirection)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> Map <span class="hljs-title">buildMap</span><span
          class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> <span class="hljs-keyword">new</span> Map(startRoom, goalRoom, timeToFinish, initialGold, playerFacingDirection);
  }
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 3 : <strong>Enforce the singleton property with a private constructor or an enum type</strong>
                </p>
                <ul>
                    <li>
                        <p>I used this technique, inside DataProvider class, the class that is responsible to fetch and
                            write int the database :</p>
                        <pre class="hljs"><code><div><span class="hljs-meta">@Component</span>
<span class="hljs-meta">@Scope</span>(<span class="hljs-string">"singleton"</span>)
<span class="hljs-keyword">public</span> <span class="hljs-class"><span class="hljs-keyword">class</span> <span
                                    class="hljs-title">DataProvider</span> </span>{

<span class="hljs-meta">@Autowired</span>
<span class="hljs-keyword">private</span> DataSource dataSource;
<span class="hljs-keyword">private</span> <span class="hljs-keyword">static</span> Connection con;
<span class="hljs-keyword">private</span> <span class="hljs-keyword">static</span> DataProvider instance = <span
                                    class="hljs-keyword">new</span> DataProvider();

<span class="hljs-function"><span class="hljs-keyword">private</span> <span class="hljs-title">DataProvider</span><span
        class="hljs-params">()</span> </span>{ <span class="hljs-comment">//singleton</span>
}

<span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">static</span> DataProvider <span
        class="hljs-title">getInstance</span><span class="hljs-params">()</span> </span>{
  <span class="hljs-keyword">return</span> instance;
}
...
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 5 : <strong>Avoid creating unnecessary objects</strong></p>
                <ul>
                    <li>
                        <p>There is an example for this in the book and it's not to do this :</p>
                        <pre class="hljs"><code><div>String s = <span class="hljs-keyword">new</span> String(<span
                                class="hljs-string">"stringette"</span>);  <span
                                class="hljs-comment">// DON'T DO THIS!</span>
</div></code></pre>
                        <p>and to do this insisted :</p>
                        <pre class="hljs"><code><div>String s = <span class="hljs-string">"stringette"</span>;
</div></code></pre>
                        <p>this is a basic approach to create strings in any application, I did follow it and I followed
                            another approach to achieve this rule by using <strong>Proxy Design Pattern</strong>, we can
                            find that inside MapLoader class</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">MapLoader</span> </span>{
  <span class="hljs-keyword">private</span> Map map;
  <span class="hljs-keyword">private</span> File file;

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-title">MapLoader</span><span
          class="hljs-params">(File file)</span> </span>{
    <span class="hljs-keyword">if</span> (file == <span class="hljs-keyword">null</span>) {
      <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"file value is null!"</span>);
    }
    <span class="hljs-keyword">this</span>.file = file;
  }

  <span class="hljs-function"><span class="hljs-keyword">public</span> Map <span class="hljs-title">getMap</span><span
          class="hljs-params">()</span> </span>{
    load();
    <span class="hljs-keyword">return</span> map;
  }

  <span class="hljs-function"><span class="hljs-keyword">public</span> String <span
          class="hljs-title">getName</span><span class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> file.getName();
  }

  <span class="hljs-function"><span class="hljs-keyword">private</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">load</span><span class="hljs-params">()</span> </span>{<span class="hljs-comment">//proxy pattern</span>

    <span class="hljs-keyword">if</span> (map != <span class="hljs-keyword">null</span>) {
      <span class="hljs-keyword">return</span>;
    }

    <span class="hljs-keyword">try</span> {
      FileInputStream fileInputStream = <span class="hljs-keyword">new</span> FileInputStream(file);
      ObjectInputStream objectInputStream = <span class="hljs-keyword">new</span> ObjectInputStream(fileInputStream);
      map = (Map) objectInputStream.readObject();

    } <span class="hljs-keyword">catch</span> (IOException e) {
      e.printStackTrace();
    } <span class="hljs-keyword">catch</span> (ClassNotFoundException e) {
      e.printStackTrace();
    }

  }


}
</div></code></pre>
                        <p>as you can see, we just create one map from the serialized File</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">if</span> (map != <span
                                class="hljs-keyword">null</span>) {
  <span class="hljs-keyword">return</span>;
}
</div></code></pre>
                        <p>this is the magical part</p>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 6 : <strong>Eliminate obsolete object references</strong></p>
                <ul>
                    <li>
                        <p>To achieve no memory leak or memory loitering in the code, object elimination must be done in
                            the right way</p>
                        <pre class="hljs"><code><div>  <span class="hljs-keyword">private</span> ArrayList&lt;Item&gt; itemList;
</div></code></pre>
                        <p>Adding and removing from this ArrayList is done in a safe way</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">addItem</span><span class="hljs-params">(Item item)</span> </span>{
  <span class="hljs-keyword">if</span> (item == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"item value is null"</span>);
  }

  itemList.add(item);
}

<span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
        class="hljs-title">removeItem</span><span class="hljs-params">(Item item)</span> </span>{
  <span class="hljs-keyword">if</span> (item == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"item value is null"</span>);
  }

  itemList.remove(item);
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 8 : <strong>Obey the general contract when overriding equals</strong></p>
                <ul>
                    <li>
                        <p>I did override equals, and doing it right is not easy, but with the help of Intellij IDE and
                            some tips from the book it becomes easier, examples :</p>
                        <pre class="hljs"><code><div><span class="hljs-meta">@Override</span>
<span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">boolean</span> <span
        class="hljs-title">equals</span><span class="hljs-params">(Object o)</span> </span>{
  <span class="hljs-keyword">if</span> (<span class="hljs-keyword">this</span> == o) {
    <span class="hljs-keyword">return</span> <span class="hljs-keyword">true</span>;
  }
  <span class="hljs-keyword">if</span> (o == <span class="hljs-keyword">null</span> || getClass() != o.getClass()) {
    <span class="hljs-keyword">return</span> <span class="hljs-keyword">false</span>;
  }
  <span class="hljs-keyword">if</span> (!<span class="hljs-keyword">super</span>.equals(o)) {
    <span class="hljs-keyword">return</span> <span class="hljs-keyword">false</span>;
  }
  Key key = (Key) o;
  <span class="hljs-keyword">return</span> name.equals(key.name);
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-meta">@Override</span>
<span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">boolean</span> <span
        class="hljs-title">equals</span><span class="hljs-params">(Object o)</span> </span>{
  <span class="hljs-keyword">if</span> (<span class="hljs-keyword">this</span> == o) {
    <span class="hljs-keyword">return</span> <span class="hljs-keyword">true</span>;
  }
  <span class="hljs-keyword">if</span> (o == <span class="hljs-keyword">null</span> || getClass() != o.getClass()) {
    <span class="hljs-keyword">return</span> <span class="hljs-keyword">false</span>;
  }
  ItemStatus that = (ItemStatus) o;

  <span class="hljs-keyword">for</span> (Item item : that.itemList) <span class="hljs-keyword">if</span> (!itemList.contains(item)) <span
                                    class="hljs-keyword">return</span> <span class="hljs-keyword">false</span>;

  <span class="hljs-keyword">return</span> <span class="hljs-keyword">true</span>;
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 9 : <strong>Always override hashCode when you override equals</strong></p>
                <ul>
                    <li>
                        <p>I did this so we don't have a violation of the general contract for
                            <code>Object.hashCode</code>, which will prevent our class from functioning properly in
                            conjunction with all hash-based collections, including <code>HashMap</code>,
                            <code>HashSet</code>, and <code>Hashtable</code>, example :</p>
                        <pre class="hljs"><code><div><span class="hljs-meta">@Override</span>
<span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">int</span> <span
        class="hljs-title">hashCode</span><span class="hljs-params">()</span> </span>{<span class="hljs-comment">//this hasCode() is for ItemStatus class</span>
  <span class="hljs-keyword">int</span> hash = <span class="hljs-number">31</span>;
  <span class="hljs-keyword">for</span> (Item item : itemList) hash = ((hash + item.hashCode()) * <span
                                    class="hljs-number">31</span>) % Integer.MAX_VALUE;

  <span class="hljs-keyword">return</span> hash;
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 13 : <strong>Minimize the accessibility of classes and members</strong></p>
                <ul>
                    <li>
                        <p>&quot;The single most important factor that distinguishes a well-designed module from a
                            poorly designed one is the degree to which the module hides its internal data and other
                            implementation details from other modules&quot; Joshua's "Effective Java" book</p>
                        <p>In this current version there is a 60+ classes, non of them have a public attributes, all of
                            them have a private attributes</p>
                        <p>examples :</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-keyword">abstract</span> <span class="hljs-class"><span
                                class="hljs-keyword">class</span> <span class="hljs-title">Trader</span> <span
                                class="hljs-keyword">implements</span> <span
                                class="hljs-title">Serializable</span> </span>{
  <span class="hljs-keyword">private</span> ItemStatus itemStatus;
  <span class="hljs-keyword">private</span> GoldStatus goldStatus;
  ...
}
</div></code></pre>
                        <pre class="hljs"><code><div>  <span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">Player</span> <span
                                class="hljs-keyword">extends</span> <span class="hljs-title">Trader</span> </span>{
  <span class="hljs-keyword">private</span> Direction facingDirection;
  <span class="hljs-keyword">private</span> Light heldLight;
  <span class="hljs-keyword">private</span> Room currentRoom;
  ...
  }
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 14 : <strong>In public classes, use accessor methods, not public fields</strong></p>
                <ul>
                    <li>
                        <p>A basic rule that every programmer must obey, example :</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">ItemStatus</span> <span
                                class="hljs-keyword">implements</span> <span
                                class="hljs-title">Serializable</span> </span>{
  <span class="hljs-keyword">private</span> ArrayList&lt;Item&gt; itemList;
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-title">ItemStatus</span><span
          class="hljs-params">()</span> </span>{
    itemList = <span class="hljs-keyword">new</span> ArrayList();
  }

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">addItem</span><span class="hljs-params">(Item item)</span> </span>{
    <span class="hljs-keyword">if</span> (item == <span class="hljs-keyword">null</span>) {
      <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"item value is null"</span>);
    }

    itemList.add(item);
  }

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">removeItem</span><span class="hljs-params">(Item item)</span> </span>{
    <span class="hljs-keyword">if</span> (item == <span class="hljs-keyword">null</span>) {
      <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"item value is null"</span>);
    }

    itemList.remove(item);
  }
  <span class="hljs-function"><span class="hljs-keyword">public</span> Item <span
          class="hljs-title">getItemByIndex</span><span class="hljs-params">(<span class="hljs-keyword">int</span> index)</span> </span>{
    <span class="hljs-keyword">if</span> (isValidIndex(index) == <span class="hljs-keyword">false</span>) {
      <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> IndexOutOfBoundsException(<span
                                    class="hljs-string">"This is not a valid index!"</span>);
    }
    <span class="hljs-keyword">return</span> itemList.get(index);
  }
...
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 18 : <strong>Prefer interfaces to abstract classes</strong></p>
                <ul>
                    <li>
                        <p>Abstract classes and interfaces in Java are mechanisms for defining a type that permits
                            multiple implementations, sometimes abstracting solve duplication problems, but we don't
                            really face that all the time, the problem with abstract classes that we can't extend two of
                            them for the same class, but that is not the case for interfaces, we can do as much as we
                            need, examples :</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">interface</span> <span class="hljs-title">Command</span> </span>{
  <span class="hljs-function"><span class="hljs-keyword">void</span> <span class="hljs-title">execute</span><span
          class="hljs-params">()</span></span>;
  <span class="hljs-function">String <span class="hljs-title">name</span><span class="hljs-params">()</span></span>;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">interface</span> <span class="hljs-title">Checkable</span> </span>{
  <span class="hljs-function">String <span class="hljs-title">check</span><span class="hljs-params">()</span></span>;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">interface</span> <span class="hljs-title">RoomObject</span> </span>{
  <span class="hljs-function">String <span class="hljs-title">look</span><span class="hljs-params">()</span></span>;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">interface</span> <span class="hljs-title">LootHider</span> </span>{
  <span class="hljs-function">Loot <span class="hljs-title">getLoot</span><span class="hljs-params">()</span></span>;
  <span class="hljs-function"><span class="hljs-keyword">void</span> <span class="hljs-title">loot</span><span
          class="hljs-params">(Player player)</span></span>;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-keyword">abstract</span> <span class="hljs-class"><span
                                class="hljs-keyword">class</span> <span class="hljs-title">Entryway</span> <span
                                class="hljs-keyword">extends</span> <span class="hljs-title">Lockable</span> <span
                                class="hljs-keyword">implements</span> <span class="hljs-title">RoomObject</span>, <span
                                class="hljs-title">Checkable</span> </span>{...}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 19 : <strong>Use interfaces only to define types</strong></p>
                <ul>
                    <li>
                        <p>All of the Interfaces that are implemented in the code are used to only define types</p>
                        <p>'<em>constant interface</em>' is a type of interfaces that fails this rule, and I don't use
                            it here</p>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 23 : <strong>Don't use raw types in new code</strong></p>
                <ul>
                    <li>
                        <p>&quot;As mentioned throughout this book, it pays to discover errors as soon as possible after
                            they are made, ideally at compile time. In this case, you don't discover the error till
                            runtime, long after it has happened, and in code that is far removed from the code
                            containing the error.&quot;</p>
                        <p>Using raw types in code, is a good way to waste time searching through the code base looking
                            for the method that caused <code>ClassCastException</code>, examples were i didn't make this
                            mistake :</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">private</span> EnumMap&lt;Direction, Room&gt; nextRoom;
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">private</span> ArrayList&lt;Item&gt; itemList;
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 25: <strong>Prefer lists to arrays</strong></p>
                <ul>
                    <li>I didn't use arrays in my code, since using List is a good way to find out about mistakes inside
                        my code at compile time, rather than runtime
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 33: <strong>Use EnumMap instead of ordinal indexing</strong></p>
                <ul>
                    <li>
                        <p>I used enum in my code for Directions, since Direction values are constants, and in my code I
                            used EnumMap, it helped the code, since it's cleaner and it's optimized for
                            <strong>enum</strong> keys while <strong>HashMap</strong> is a general purpose
                            <strong>Map</strong> implementation similar to Hashtable, examples :</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-keyword">abstract</span> <span class="hljs-class"><span
                                class="hljs-keyword">class</span> <span class="hljs-title">Entryway</span> <span
                                class="hljs-keyword">extends</span> <span class="hljs-title">Lockable</span> <span
                                class="hljs-keyword">implements</span> <span class="hljs-title">RoomObject</span>, <span
                                class="hljs-title">Checkable</span> </span>{

  <span class="hljs-keyword">private</span> EnumMap&lt;Direction, Room&gt; nextRoom;
  ...
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span
                                class="hljs-title">Room</span> <span class="hljs-keyword">implements</span> <span
                                class="hljs-title">Serializable</span> </span>{
  <span class="hljs-comment">// ex : roomObjects.get(Direction.NORTH) gives us the roomObject on the northern wall</span>
  <span class="hljs-keyword">private</span> EnumMap&lt;Direction, RoomObject&gt; roomObjects;
  ...
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 38 : <strong>Check parameters for validity</strong></p>
                <ul>
                    <li>
                        <p>There is many forms to apply this rule, we could apply it to check if <code>int</code> value
                            make since in a specific scenario, or we could use it to check if an object value is not
                            null, this is what I done in my code to apply this rule, examples :</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">deposit</span><span class="hljs-params">(<span class="hljs-keyword">int</span> amount)</span> </span>{
  <span class="hljs-keyword">if</span> (amount &lt; <span class="hljs-number">0</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> IllegalArgumentException(<span
                                    class="hljs-string">"This deposit value is illegal(negative)!"</span>);
  }

  balance += amount;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">removeItem</span><span class="hljs-params">(Item item)</span> </span>{
  <span class="hljs-keyword">if</span> (item == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"item value is null"</span>);
  }

  itemList.remove(item);
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 40 : <strong>Design method signatures carefully</strong></p>
                <ul>
                    <li><strong>Choose method names carefully</strong> : this point is reported in &quot;<strong>How my
                        code satisfies the clean code principles according to "Clean Code" book</strong>&quot;
                    </li>
                    <li>&quot;<strong>Avoid long parameter lists</strong>&quot; : this point is reported in
                        &quot;<strong>How my code satisfies the clean code principles according to "Clean Code"
                            book</strong>&quot;
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 50 : <strong>Avoid strings where other types are more appropriate</strong></p>
                <ul>
                    <li>
                        <p>&quot;<strong>Strings are poor substitutes for enum types</strong>&quot; : this is why I used
                            enum for Direction, since it makes more since and easier to work with</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-keyword">enum</span> Direction {
  NORTH,
  EAST,
  SOUTH,
  WEST;
  ...
}
</div></code></pre>
                    </li>
                    <li>
                        <p><strong>Strings are poor substitutes for aggregate types</strong> : I created a Key Class,
                            because creating a string to represent a Key name and price is a really bad idea</p>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 51 : <strong>Beware the performance of string concatenation</strong></p>
                <ul>
                    <li>
                        <p>Since String Objects are immutable, and building some data using them is not good for
                            performance, so I used StringBuilder since it helped me build my Player Status in efficient
                            way, example :</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> StringBuilder <span
                                class="hljs-title">getItemsStatus</span><span
                                class="hljs-params">()</span> </span>{<span class="hljs-comment">//inside ItemStatus class</span>
  StringBuilder status = <span class="hljs-keyword">new</span> StringBuilder(<span class="hljs-string">"Item status : \n"</span>);
  <span class="hljs-keyword">for</span> (<span class="hljs-keyword">int</span> i = <span class="hljs-number">0</span>; i &lt; itemList.size(); i++) {
    status.append(<span class="hljs-string">"\t"</span> + (i) + <span class="hljs-string">" : "</span> + itemList.get(i) + <span
                                    class="hljs-string">"\n"</span>);
  }
  <span class="hljs-keyword">return</span> status;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> StringBuilder <span
                                class="hljs-title">getGoldStatus</span><span class="hljs-params">()</span> </span>{<span
                                class="hljs-comment">//inside GoldStatus class</span>
  <span class="hljs-keyword">return</span> <span class="hljs-keyword">new</span> StringBuilder(<span
                                    class="hljs-string">"Gold status : "</span> + getBalance() + <span
                                    class="hljs-string">"\n"</span>);
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> StringBuilder <span
                                class="hljs-title">getStatus</span><span class="hljs-params">()</span> </span>{
  StringBuilder status = goldStatus.getGoldStatus();
  status.append(itemStatus.getItemsStatus());
  <span class="hljs-keyword">return</span> status;
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 57 : <strong>Use exceptions only for exceptional conditions</strong></p>
                <ul>
                    <li>All my code exceptions satisfy this rule</li>
                </ul>
            </li>
            <li>
                <p>Item 60 : <strong>Favor the use of standard exceptions</strong></p>
                <ul>
                    <li>
                        <p>Since the first version of my code, I used just standard exceptions, I didn't feel the need
                            of creating new Exception types, but after reading this book I realized I'm not really using
                            them the best way, I used <code>IllegalArgumentException</code> almost every where, but
                            there is other standard exceptions that is more specific, like
                            <code>NullPointerException </code> and <code>IndexOutOfBoundsException</code> , but
                            eventually I fixed it</p>
                        <p>example :</p>
                        <p>Before the fix</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">final</span> <span
                                class="hljs-keyword">void</span> <span class="hljs-title">buyItem</span><span
                                class="hljs-params">(
    Trader trader, Item item)</span> </span>{

  <span class="hljs-keyword">if</span> (trader == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> IllegalArgumentException(<span
                                    class="hljs-string">"trader value is null!"</span>);
  }

  <span class="hljs-keyword">if</span> (item == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> IllegalArgumentException(<span
                                    class="hljs-string">"item value is null!"</span>);
  }

  trader.sellItem(<span class="hljs-keyword">this</span>, item);
}
</div></code></pre>
                        <p>After the fix</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">final</span> <span
                                class="hljs-keyword">void</span> <span class="hljs-title">buyItem</span> <span
                                class="hljs-params">(Trader trader, Item item)</span> </span>{
  <span class="hljs-keyword">if</span> (trader == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException (<span
                                    class="hljs-string">"trader value is null!"</span>);
  }

  <span class="hljs-keyword">if</span> (item == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException (<span
                                    class="hljs-string">"item value is null!"</span>);
  }

  trader.sellItem(<span class="hljs-keyword">this</span>, item);
}
</div></code></pre>
                        <p>more</p>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-title">Map</span><span
                                class="hljs-params">(	//map constructor
    Room startRoom,
    Room goalRoom,
    <span class="hljs-keyword">int</span> timeToFinish,
    <span class="hljs-keyword">int</span> initialGold,
    Direction playerFacingDirection)</span> </span>{

  <span class="hljs-keyword">if</span> (startRoom == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"start room value is null!"</span>);
  }

  <span class="hljs-keyword">if</span> (goalRoom == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"goal room value is null!"</span>);
  }

  <span class="hljs-keyword">if</span> (timeToFinish &lt; <span class="hljs-number">0</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> IllegalArgumentException(<span
                                    class="hljs-string">"time to finish value is invalid"</span>);
  }

  <span class="hljs-keyword">if</span> (initialGold &lt; <span class="hljs-number">0</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> IllegalArgumentException(<span
                                    class="hljs-string">"initial gold value is invalid"</span>);
  }

  <span class="hljs-keyword">if</span> (playerFacingDirection == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"player facing direction value is null!"</span>);
  }

  <span class="hljs-keyword">this</span>.startRoom = startRoom;
  <span class="hljs-keyword">this</span>.goalRoom = goalRoom;
  <span class="hljs-keyword">this</span>.timeToFinish = timeToFinish;
  <span class="hljs-keyword">this</span>.initialGold = initialGold;
  <span class="hljs-keyword">this</span>.playerFacingDirection = playerFacingDirection;
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 66 : <strong>Synchronize access to shared mutable data</strong></p>
                <ul>
                    <li>latter on in this report we will discuss &quot;<strong>Concurrency issues in my code and how I
                        dealt with it</strong>&quot;
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 74 : <strong>Implement Serializable judiciously</strong></p>
                <p>I used serialization for two reasons, the first one is after creating a Map, we serialize it into a
                    file, so we can read the file later and load the map, the second use of serialization in my code is
                    for saving the original state of the selected map in a String Object, and when we want to restart
                    the map we read the serialized String Object</p>
                <ul>
                    <li>
                        <p>To save a Map into File, so we can load them later</p>
                        <p>I would create a map and serialize it into a file that we can read later, I created a
                            <strong>MapLoader</strong> class, that reads a file and retrieve the data from it, I used
                            <strong>Proxy Design Pattern</strong> here so we don't load the same map more than once, we
                            talked about this design pattern earlier in this report and we will talk about it later in
                            details</p>
                    </li>
                    <li>
                        <p>To save the original state of the selected map</p>
                        <p>After the map and game mode are selected, we serialize the selected map into a String Object,
                            so after a restart we get the original state back, this code is inside <strong>Mode</strong>
                            class</p>
                        <pre class="hljs"><code><div><span
                                class="hljs-keyword">private</span> String serializedMap; <span class="hljs-comment">// store original map</span>
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">setMap</span><span class="hljs-params">(Map map)</span> </span>{
  <span class="hljs-keyword">if</span> (map == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> IllegalArgumentException(<span
                                    class="hljs-string">"map value is null!"</span>);
  }
  <span class="hljs-keyword">this</span>.map = map;
  saveOriginalMap();
  restartMap();
  initialValuesToRestart();
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">private</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">saveOriginalMap</span><span class="hljs-params">()</span> </span>{
  ByteArrayOutputStream bos = <span class="hljs-keyword">new</span> ByteArrayOutputStream();
  ObjectOutput out = <span class="hljs-keyword">null</span>;
  <span class="hljs-keyword">try</span> {
    out = <span class="hljs-keyword">new</span> ObjectOutputStream(bos);
    out.writeObject(map);
  } <span class="hljs-keyword">catch</span> (IOException e) {
    e.printStackTrace();
  }
  <span class="hljs-keyword">final</span> <span class="hljs-keyword">byte</span>[] byteArray = bos.toByteArray();
  serializedMap = Base64.getEncoder().encodeToString(byteArray);
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-function"><span
                                class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
                                class="hljs-title">restartMap</span><span class="hljs-params">()</span> </span>{
  <span class="hljs-keyword">final</span> <span class="hljs-keyword">byte</span>[] bytes = Base64.getDecoder().decode(serializedMap);

  ByteArrayInputStream bis = <span class="hljs-keyword">new</span> ByteArrayInputStream(bytes);
  ObjectInput in = <span class="hljs-keyword">null</span>;
  <span class="hljs-keyword">try</span> {
    in = <span class="hljs-keyword">new</span> ObjectInputStream(bis);
    map = (Map) in.readObject();
  } <span class="hljs-keyword">catch</span> (IOException e) {
    e.printStackTrace();
  } <span class="hljs-keyword">catch</span> (ClassNotFoundException e) {
    e.printStackTrace();
  }
}
</div></code></pre>
                    </li>
                </ul>
            </li>
        </ul>
        <h2 id="discuss-the-design-patterns-i-used-to-implement-my-solutions-and-why"><strong>Discuss the design
            patterns I used to implement my solutions and why</strong></h2>
        <p>This is my favorite part of the report, we will discuss 5 design patterns and how I used them</p>
        <ul>
            <li><strong>Command Design Pattern</strong></li>
            <li><strong>Singleton Design Pattern</strong></li>
            <li><strong>Proxy Design Pattern</strong></li>
            <li><strong>Template Method Design Pattern</strong></li>
            <li><strong>Builder Design Pattern</strong></li>
        </ul>
        <h3 id="command-design-pattern"><strong>Command Design Pattern</strong></h3>
        <p>This design made the most thing I was worried about in this project easy to solve, I was worried because
            having multiple commands and implementing the needed action for them inside a specific class, will make the
            commands and that specific class coupled and as a result of that we will suffer when we want to add a new
            command</p>
        <p>The idea here is to separate the commands from the controller (in our case the controller is the game
            mode)</p>
        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span class="hljs-class"><span
                class="hljs-keyword">interface</span> <span class="hljs-title">Command</span> </span>{
  <span class="hljs-function"><span class="hljs-keyword">void</span> <span class="hljs-title">execute</span><span
          class="hljs-params">()</span></span>;
  <span class="hljs-function">String <span class="hljs-title">name</span><span class="hljs-params">()</span></span>;
}
</div></code></pre>
        <p>This is the Command interface</p>
        <p>I Created two other Command sub types (later on we can add more sub types for commands if needed), the first
            sub type command is <code>GameModeCommand</code>, witch is responsible of the command that effect the Game
            Mode it self, like <code>restart</code> and <code>exit</code></p>
        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span class="hljs-keyword">abstract</span> <span
                class="hljs-class"><span class="hljs-keyword">class</span> <span
                class="hljs-title">GameModeCommand</span> <span class="hljs-keyword">implements</span> <span
                class="hljs-title">Command</span> </span>{
  <span class="hljs-function">Mode mode
  <span class="hljs-keyword">public</span> <span class="hljs-title">GameModeCommand</span><span class="hljs-params">(Mode mode)</span> </span>{

    <span class="hljs-keyword">if</span> (mode == <span class="hljs-keyword">null</span>) {
      <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                    class="hljs-string">"game controller value is null!"</span>);
    }
    <span class="hljs-keyword">this</span>.mode = mode;
  }

  <span class="hljs-function"><span class="hljs-keyword">public</span> Mode <span class="hljs-title">getMode</span><span
          class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> mode;
  }
}
</div></code></pre>
        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span class="hljs-class"><span
                class="hljs-keyword">class</span> <span class="hljs-title">RestartMapCommand</span> <span
                class="hljs-keyword">extends</span> <span class="hljs-title">GameModeCommand</span> </span>{
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-title">RestartMapCommand</span><span
          class="hljs-params">(Mode mode)</span> </span>{
    <span class="hljs-keyword">super</span>(mode);
  }

  <span class="hljs-meta">@Override</span>
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">execute</span><span class="hljs-params">()</span> </span>{
    getMode().restart();
  }

  <span class="hljs-meta">@Override</span>
  <span class="hljs-function"><span class="hljs-keyword">public</span> String <span class="hljs-title">name</span><span
          class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> <span class="hljs-string">"Restart Map"</span>;
  }
}
</div></code></pre>
        <p>This is a concreate class(<code>RestartMapCommand</code>) that extends <code>GameModeCommand</code>, there is
            another one which is similar <code>QuitMapCommand</code></p>
        <p>The other sub type that I created is <code>PlayerCommand </code>, which is responsible of the commands that
            effect the player and the gameplay, like <code>look</code> and <code>check</code></p>
        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span class="hljs-keyword">abstract</span> <span
                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">PlayerCommand</span> <span
                class="hljs-keyword">implements</span> <span class="hljs-title">Command</span> </span>{

  <span class="hljs-keyword">private</span> Player player;

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span
          class="hljs-title">PlayerCommand</span><span class="hljs-params">(Player player)</span> </span>{
    <span class="hljs-keyword">if</span> (player == <span class="hljs-keyword">null</span>) {
      <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                    class="hljs-string">"player value is null!"</span>);
    }

    <span class="hljs-keyword">this</span>.player = player;
  }

  <span class="hljs-function"><span class="hljs-keyword">public</span> Player <span
          class="hljs-title">getPlayer</span><span class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> player;
  }
}
</div></code></pre>
        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span class="hljs-class"><span
                class="hljs-keyword">class</span> <span class="hljs-title">SwitchRoomLightCommand</span> <span
                class="hljs-keyword">extends</span> <span class="hljs-title">PlayerCommand</span> </span>{
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span
          class="hljs-title">SwitchRoomLightCommand</span><span class="hljs-params">(Player player)</span> </span>{
    <span class="hljs-keyword">super</span>(player);
  }

  <span class="hljs-meta">@Override</span>
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">execute</span><span class="hljs-params">()</span> </span>{
    getPlayer().switchRoomLight();
  }

  <span class="hljs-meta">@Override</span>
  <span class="hljs-function"><span class="hljs-keyword">public</span> String <span class="hljs-title">name</span><span
          class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> <span class="hljs-string">"Switch Room Light"</span>;
  }
}
</div></code></pre>
        <h3 id="singleton-design-pattern"><strong>Singleton Design Pattern</strong></h3>
        <p>Earlier when I started implementing the code for this project, I built the <strong>Player</strong> class as a
            singleton, but that was wrong, because I restricted the game to have just one player instead of having two
            or more or more players, eventually I made just two singleton classes and they are
            <strong>GameDriver</strong> and <strong>DataProvider</strong></p>
        <pre class="hljs"><code><div><span class="hljs-comment">/**
 * GameDriver is the main entity in this game It controls the different maps and game modes that it
 * has to offer
 */</span>
<span class="hljs-keyword">public</span> <span class="hljs-class"><span class="hljs-keyword">class</span> <span
                    class="hljs-title">GameDriver</span> </span>{

    <span class="hljs-keyword">private</span> <span class="hljs-keyword">static</span> GameDriver gameDriver = <span
                    class="hljs-keyword">new</span> GameDriver();
    <span class="hljs-keyword">private</span> ArrayList&lt;File&gt; maps;

    <span class="hljs-function"><span class="hljs-keyword">private</span> <span
            class="hljs-title">GameDriver</span><span class="hljs-params">()</span> </span>{
        MapCreator mapCreator = <span class="hljs-keyword">new</span> MapCreator();
        maps = <span class="hljs-keyword">new</span> ArrayList&lt;File&gt;();
        findMaps();
    }

    <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">static</span> GameDriver <span
            class="hljs-title">getInstance</span><span class="hljs-params">()</span> </span>{
        <span class="hljs-keyword">return</span> gameDriver;
    }
    ...
}
</div></code></pre>
        <pre class="hljs"><code><div><span class="hljs-meta">@Component</span>
<span class="hljs-meta">@Scope</span>(<span class="hljs-string">"singleton"</span>)
<span class="hljs-keyword">public</span> <span class="hljs-class"><span class="hljs-keyword">class</span> <span
                    class="hljs-title">DataProvider</span> </span>{
    <span class="hljs-meta">@Autowired</span>
    <span class="hljs-keyword">private</span> DataSource dataSource;
    <span class="hljs-keyword">private</span> <span class="hljs-keyword">static</span> Connection con;
    <span class="hljs-keyword">private</span> <span class="hljs-keyword">static</span> DataProvider instance = <span
                    class="hljs-keyword">new</span> DataProvider();

    <span class="hljs-function"><span class="hljs-keyword">private</span> <span
            class="hljs-title">DataProvider</span><span class="hljs-params">()</span> </span>{ <span
                    class="hljs-comment">//singleton</span>
    }

    <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">static</span> DataProvider <span
            class="hljs-title">getInstance</span><span class="hljs-params">()</span> </span>{
        <span class="hljs-keyword">return</span> instance;
    }
    ...
}
</div></code></pre>
        <h3 id="proxy-design-pattern"><strong>Proxy Design Pattern</strong></h3>
        <p>There are 3 reasons/ways to use <strong>Proxy Design Pattern</strong></p>
        <p><strong>Remote</strong> : when you want to access something that is remote(another server or namespace, ...)
            <strong>Virtual</strong> : controls access to a resource that is expensive to create (image, ...)
            <strong>Protection</strong> : control access for a resource based on users' access rights</p>
        <p>I used <strong>Virtual Proxy Design Pattern</strong>, because it makes my code avoid reading any file twice,
            I have <strong>MapLoader</strong> class that reads from files to deserialize Objects, and this design
            pattern helps with performance, since if you want to start a new game with a map that you played before,
            then no need to re read the file again and deserialize it's content</p>
        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span class="hljs-class"><span
                class="hljs-keyword">class</span> <span class="hljs-title">MapLoader</span> </span>{
  <span class="hljs-keyword">private</span> Map map;
  <span class="hljs-keyword">private</span> File file;

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-title">MapLoader</span><span
          class="hljs-params">(File file)</span> </span>{
    <span class="hljs-keyword">if</span> (file == <span class="hljs-keyword">null</span>) {
      <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                    class="hljs-string">"file value is null!"</span>);
    }
    <span class="hljs-keyword">this</span>.file = file;
  }

  <span class="hljs-function"><span class="hljs-keyword">public</span> Map <span class="hljs-title">getMap</span><span
          class="hljs-params">()</span> </span>{
    load();
    <span class="hljs-keyword">return</span> map;
  }

  <span class="hljs-function"><span class="hljs-keyword">public</span> String <span
          class="hljs-title">getName</span><span class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> file.getName();
  }

  <span class="hljs-function"><span class="hljs-keyword">private</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">load</span><span class="hljs-params">()</span> </span>{ <span class="hljs-comment">// proxy pattern</span>

    <span class="hljs-keyword">if</span> (map != <span class="hljs-keyword">null</span>) {
      <span class="hljs-keyword">return</span>;
    }

    <span class="hljs-keyword">try</span> {
      FileInputStream fileInputStream = <span class="hljs-keyword">new</span> FileInputStream(file);
      ObjectInputStream objectInputStream = <span class="hljs-keyword">new</span> ObjectInputStream(fileInputStream);
      map = (Map) objectInputStream.readObject();

    } <span class="hljs-keyword">catch</span> (IOException e) {
      e.printStackTrace();
    } <span class="hljs-keyword">catch</span> (ClassNotFoundException e) {
      e.printStackTrace();
    }
  }
}
</div></code></pre>
        <h3 id="builder-design-pattern"><strong>Builder Design Pattern</strong></h3>
        <p>This design pattern helped me with the creation of <strong>Map</strong> Object</p>
        <p><strong>Map</strong> class has a lot of attributes that we need to specify, so instead of using the <strong>Map</strong>
            constructor with all of these arguments, we could implement a <strong>MapBuilder</strong> to make the map
            creation easier on us</p>
        <pre class="hljs"><code><div><span class="hljs-function"><span class="hljs-keyword">public</span> <span
                class="hljs-title">Map</span><span class="hljs-params">(Room startRoom, Room goalRoom, <span
                class="hljs-keyword">int</span> timeToFinish, <span class="hljs-keyword">int</span> initialGold,Direction playerFacingDirection)</span>
</span>{...}<span class="hljs-comment">//This is the Map constructor </span>
</div></code></pre>
        <p>this is the <strong>MapBuilder</strong> class</p>
        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span class="hljs-class"><span
                class="hljs-keyword">class</span> <span class="hljs-title">MapBuilder</span> </span>{
  <span class="hljs-keyword">private</span> Room startRoom;
  <span class="hljs-keyword">private</span> Room goalRoom;
  <span class="hljs-keyword">private</span> <span class="hljs-keyword">int</span> timeToFinish;
  <span class="hljs-keyword">private</span> <span class="hljs-keyword">int</span> initialGold;
  <span class="hljs-keyword">private</span> Direction playerFacingDirection;

  <span class="hljs-function"><span class="hljs-keyword">public</span> MapBuilder <span
          class="hljs-title">setStartRoom</span><span class="hljs-params">(Room startRoom)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> MapBuilder <span
          class="hljs-title">setGoalRoom</span><span class="hljs-params">(Room goalRoom)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> MapBuilder <span class="hljs-title">setTimeToFinish</span><span
          class="hljs-params">(<span class="hljs-keyword">int</span> timeToFinish)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> MapBuilder <span class="hljs-title">setInitialGold</span><span
          class="hljs-params">(<span class="hljs-keyword">int</span> initialGold)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> MapBuilder <span class="hljs-title">setPlayerFacingDirection</span><span
          class="hljs-params">(Direction playerFacingDirection)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> Map <span class="hljs-title">buildMap</span><span
          class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> <span class="hljs-keyword">new</span> Map(startRoom, goalRoom, timeToFinish, initialGold, playerFacingDirection);
  }
}
</div></code></pre>
        <h3 id="template-method-design-pattern"><strong>Template Method Design Pattern</strong></h3>
        <p><strong>Template Method Design Pattern</strong> made me build some functionality easier, and I have used it
            more than once inside this project</p>
        <p>these are some <code>final</code> methods that I consider <strong>Template Method</strong></p>
        <pre class="hljs"><code><div><span class="hljs-function"><span class="hljs-keyword">public</span> <span
                class="hljs-keyword">final</span> <span class="hljs-keyword">void</span> <span class="hljs-title">sellItem</span><span
                class="hljs-params">(Trader trader, Item item)</span> </span>{<span class="hljs-comment">//inside Trader Class</span>
  <span class="hljs-keyword">if</span> (trader == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                    class="hljs-string">"trader value is null!"</span>);
  }

  <span class="hljs-keyword">if</span> (item == <span class="hljs-keyword">null</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                    class="hljs-string">"item value is null!"</span>);
  }

  <span class="hljs-keyword">if</span> (!canSellItemTo(trader, item)) {
    cancelSelling();
    trader.cancelBuying();
    <span class="hljs-keyword">return</span>;
  }

  proceedSelling(item);
  trader.proceedBuying(item);
}

<span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">abstract</span> <span
        class="hljs-keyword">void</span> <span class="hljs-title">cancelBuying</span><span class="hljs-params">()</span></span>;

<span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">abstract</span> <span
        class="hljs-keyword">void</span> <span class="hljs-title">cancelSelling</span><span
        class="hljs-params">()</span></span>;

<span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">abstract</span> <span
        class="hljs-keyword">void</span> <span class="hljs-title">proceedBuying</span><span class="hljs-params">(Item item)</span></span>;

<span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">abstract</span> <span
        class="hljs-keyword">void</span> <span class="hljs-title">proceedSelling</span><span class="hljs-params">(Item item)</span></span>;
</div></code></pre>
        <h2 id="how-my-code-satisfies-the-solid-principles"><strong>How my code satisfies the SOLID principles?</strong>
        </h2>
        <ul>
            <li>
                <p><strong>Single responsibility principle</strong></p>
                <ul>
                    <li>
                        <p>&quot;<em>Do one thing and do it well</em>&quot;, We can see this in every class that I
                            implemented</p>
                        <p>To ensure this principle for functions, following &quot;<strong>SMAL!</strong> rule from
                            **chapter 3 functions ** in <strong>clean code</strong> Book&quot; is a good idea</p>
                        <p>every time I see a big function, I extract more functions out of it and make every function
                            do just one thing, look to <strong>Template Method Design Pattern</strong> for examples</p>
                        <p>Single responsibility principle is also for classes, there are 3 classes responsible with how
                            to work with maps</p>
                        <ol>
                            <li><strong>Map</strong></li>
                            <li><strong>MapBuilder</strong></li>
                            <li><strong>MapLoader</strong></li>
                        </ol>
                        <p>also <strong>Trader</strong> class (which is the parent class for <strong>Player</strong> and
                            <strong>Seller</strong>) has two composite object of type <code>GoldStatus</code> and <code>ItemStatus</code>,
                            these two classes are responsible to keep track with gold status and item status, there
                            functionality should be encapsulated, a <strong>bad</strong> thing here is not to use these
                            two classes and just implement there functionality inside <strong>Player</strong> class</p>
                    </li>
                </ul>
            </li>
            <li>
                <p><strong>Open/closed principle</strong></p>
                <ul>
                    <li>
                        <p>&quot;<em>So, you should be able to extend your existing code using OOP features like
                            inheritance via subclasses and interfaces. However, you should never modify classes,
                            interfaces, and other code units that already exist</em>&quot;</p>
                        <p>That's why I used <strong>Command Design Pattern</strong>, to implement a new command no need
                            to refactor anything, we can just simple implement our new command in a new class and just
                            add it to the needed game mode</p>
                    </li>
                </ul>
            </li>
            <li>
                <p><strong>Liskov substitution &amp;&amp; Interface segregation principles</strong></p>
                <ul>
                    <li>
                        <p>I put these two principles together because I see them very similar, no class should ever
                            inherent a method that he cant use, that's why I created these interfaces and abstract
                            classes, they help with that</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">interface</span> <span class="hljs-title">RoomObject</span> </span>{
  <span class="hljs-function">String <span class="hljs-title">look</span><span class="hljs-params">()</span></span>;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">interface</span> <span class="hljs-title">Checkable</span> </span>{
  <span class="hljs-function">String <span class="hljs-title">check</span><span class="hljs-params">()</span></span>;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-keyword">abstract</span> <span class="hljs-class"><span
                                class="hljs-keyword">class</span> <span class="hljs-title">Closeable</span> <span
                                class="hljs-keyword">implements</span> <span
                                class="hljs-title">Serializable</span> </span>{
  <span class="hljs-keyword">private</span> <span class="hljs-keyword">boolean</span> isOpen;
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">boolean</span> <span
          class="hljs-title">isOpen</span><span class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> isOpen;
  }
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">open</span><span class="hljs-params">()</span> </span>{
    isOpen = <span class="hljs-keyword">true</span>;
  }
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">close</span><span class="hljs-params">()</span> </span>{
    isOpen = <span class="hljs-keyword">false</span>;
  }
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-keyword">abstract</span> <span class="hljs-class"><span
                                class="hljs-keyword">class</span> <span class="hljs-title">Lockable</span> <span
                                class="hljs-keyword">extends</span> <span class="hljs-title">Closeable</span> </span>{
  <span class="hljs-keyword">private</span> Key lockKey;
  <span class="hljs-keyword">private</span> <span class="hljs-keyword">boolean</span> isUnlocked;
  ...
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">interface</span> <span class="hljs-title">LootHider</span> </span>{
  <span class="hljs-function">Loot <span class="hljs-title">getLoot</span><span class="hljs-params">()</span></span>;
  <span class="hljs-function"><span class="hljs-keyword">void</span> <span class="hljs-title">loot</span><span
          class="hljs-params">(Player player)</span></span>;
}
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p><strong>Dependency inversion principle</strong></p>
                <ul>
                    <li>
                        <p>&quot;<em>High-level modules should not depend on low-level modules. Both should depend on
                            abstractions. Abstractions should not depend on details. Details should depend on
                            abstractions.</em>&quot;</p>
                        <p>To show how I used this principle let's look at these two classes, <code>Chest</code> and
                            <code>Mirror</code>, as we know behind the mirror there could be a hidden key, and the chest
                            could contain keys, flashlights and gold, If we use the <code>Check</code> command on then,
                            the chest and the mirror would be looted, but the looting mechanism is different in those
                            two classes, since mirror can only have a key and chest could have any type of items and
                            gold</p>
                        <p>This is why I created these Interfaces and abstract classes</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">interface</span> <span class="hljs-title">Loot</span> </span>{
  <span class="hljs-function"><span class="hljs-keyword">void</span> <span class="hljs-title">loot</span><span
          class="hljs-params">(Player player)</span></span>;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">interface</span> <span class="hljs-title">LootHider</span> </span>{
  <span class="hljs-function">Loot <span class="hljs-title">getLoot</span><span class="hljs-params">()</span></span>;
  <span class="hljs-function"><span class="hljs-keyword">void</span> <span class="hljs-title">loot</span><span
          class="hljs-params">(Player player)</span></span>;
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">OneKeyLoot</span> <span
                                class="hljs-keyword">implements</span> <span class="hljs-title">Loot</span>, <span
                                class="hljs-title">Serializable</span> </span>{
  <span class="hljs-keyword">private</span> Key key;
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">FullLoot</span> <span
                                class="hljs-keyword">implements</span> <span class="hljs-title">Loot</span>, <span
                                class="hljs-title">Serializable</span> </span>{
  <span class="hljs-keyword">private</span> <span class="hljs-keyword">int</span> goldLoot;
  <span class="hljs-keyword">private</span> ItemStatus lootStatus;
  ...
}
</div></code></pre>
                        <p>This is <code>Chest</code> and <code>Mirror</code> classes</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">Chest</span> <span
                                class="hljs-keyword">extends</span> <span class="hljs-title">Lockable</span> <span
                                class="hljs-keyword">implements</span> <span class="hljs-title">RoomObject</span>, <span
                                class="hljs-title">Checkable</span>, <span class="hljs-title">LootHider</span> </span>{
  <span class="hljs-keyword">private</span> FullLoot loot;
  ...
  <span class="hljs-meta">@Override</span>
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">loot</span><span class="hljs-params">(Player player)</span> </span>{
    <span class="hljs-keyword">if</span> (isUnlocked()) {
      loot.loot(player);
    }
  }
  ...
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">Mirror</span> <span
                                class="hljs-keyword">implements</span> <span class="hljs-title">LootHider</span>, <span
                                class="hljs-title">Checkable</span>, <span class="hljs-title">RoomObject</span>, <span
                                class="hljs-title">Serializable</span> </span>{
  <span class="hljs-keyword">private</span> OneKeyLoot keyLoot;
  ...
  <span class="hljs-meta">@Override</span>
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">loot</span><span class="hljs-params">(Player player)</span> </span>{
    keyLoot.loot(player);
  }
  ...
}
</div></code></pre>
                        <p>This is <code>OneKeyLoot</code> and <code>FullLoot</code> classes</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">OneKeyLoot</span> <span
                                class="hljs-keyword">implements</span> <span class="hljs-title">Loot</span>, <span
                                class="hljs-title">Serializable</span> </span>{
  <span class="hljs-keyword">private</span> Key key;
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">loot</span><span class="hljs-params">(Player player)</span> </span>{
    <span class="hljs-keyword">if</span> (player == <span class="hljs-keyword">null</span>) {
      <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> NullPointerException(<span
                                    class="hljs-string">"player value is null!"</span>);
    }

    <span class="hljs-keyword">if</span> (key == <span class="hljs-keyword">null</span>) {
      System.out.println(<span class="hljs-string">"No Key is hidden here"</span>);
      <span class="hljs-keyword">return</span>;
    }
    ...
}
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span
                                class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">FullLoot</span> <span
                                class="hljs-keyword">implements</span> <span class="hljs-title">Loot</span>, <span
                                class="hljs-title">Serializable</span> </span>{
  <span class="hljs-keyword">private</span> <span class="hljs-keyword">int</span> goldLoot;
  <span class="hljs-keyword">private</span> ItemStatus lootStatus;
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">lootGold</span><span class="hljs-params">(Player player)</span> </span>{...}
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">lootItems</span><span class="hljs-params">(Player player)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">loot</span><span class="hljs-params">(Player player)</span> </span>{
   lootGold(player);
   lootItems(player);
  }
}
</div></code></pre>
                    </li>
                    <li>
                        <p>As we can see, every loot type has it's own implementation, let's go back to &quot;<em>High-level
                            modules should not depend on low-level modules. Both should depend on abstractions.
                            Abstractions should not depend on details. Details should depend on abstractions.</em>&quot;,
                            we can see this example really followed the rule</p>
                    </li>
                </ul>
            </li>
        </ul>
        <h2 id="how-my-code-satisfies-google-or-twitter-styling-guide"><strong>How my code satisfies Google (or Twitter)
            styling guide</strong></h2>
        <p>A team following a style guide helps everyone write code in a consistent way, and consistent code is easier
            to read and faster to update.</p>
        <p>After looking at Google styling guide, I realized it's hard to go back and update 3000+ lines of code to
            follow the styling guide, so I found about a tool/plugin in the intellij IDE that makes this reformatting
            much easier and I used it</p>
        <h2 id="concurrency-issues-in-my-code-and-how-i-dealt-with-it"><strong>Concurrency issues in my code and how I
            dealt with it</strong></h2>
        <p>There is a <strong>GameTimer</strong> class that is responsible for keep tracking of how many seconds have
            passed and how much is left to finish the map</p>
        <pre class="hljs"><code><div><span class="hljs-keyword">public</span> <span class="hljs-class"><span
                class="hljs-keyword">class</span> <span class="hljs-title">GameTimer</span> <span class="hljs-keyword">extends</span> <span
                class="hljs-title">Thread</span> </span>{
  <span class="hljs-keyword">private</span> <span class="hljs-keyword">int</span> seconds;
  <span class="hljs-keyword">private</span> <span class="hljs-keyword">boolean</span> timeOut;
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-title">GameTimer</span><span
          class="hljs-params">(<span class="hljs-keyword">int</span> seconds)</span> </span>{...}
  <span class="hljs-meta">@Override</span>
  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">run</span><span class="hljs-params">()</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">boolean</span> <span
          class="hljs-title">isTimeOut</span><span class="hljs-params">()</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">setSeconds</span><span class="hljs-params">(<span class="hljs-keyword">int</span> seconds)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span
          class="hljs-keyword">synchronized</span> <span class="hljs-keyword">int</span> <span class="hljs-title">getRemainingSeconds</span><span
          class="hljs-params">()</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">addSeconds</span><span class="hljs-params">(<span class="hljs-keyword">int</span> seconds)</span> </span>{...}

  <span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-keyword">void</span> <span
          class="hljs-title">removeSeconds</span><span class="hljs-params">(<span class="hljs-keyword">int</span> seconds)</span> </span>{...}
}
</div></code></pre>
        <p>Item 78 from Joshua's "Effective Java" book says : <strong>SYNCHRONIZE ACCESS TO SHARED MUTABLE DATA</strong>
        </p>
        <ul>
            <li>The values of any object of this class could be modified from multiple threads, and to make sure no <em><strong>race
                condition</strong></em> happen here we need to synchronize the <strong>critical section</strong> of the
                methods
            </li>
        </ul>
        <p>Item 79 from Joshua's "Effective Java" book says : <strong>AVOID EXCESSIVE SYNCHRONIZATION</strong></p>
        <ul>
            <li>
                <p>&quot;<em>Excessive synchronization can cause reduced performance, deadlock, or even nondeterministic
                    behavior</em>&quot;, let's take a look at <code>removeSeconds(int seconds)</code> function</p>
                <pre class="hljs"><code><div><span class="hljs-function"><span class="hljs-keyword">public</span> <span
                        class="hljs-keyword">void</span> <span class="hljs-title">removeSeconds</span><span
                        class="hljs-params">(<span class="hljs-keyword">int</span> seconds)</span> </span>{
  <span class="hljs-keyword">if</span> (seconds &lt; <span class="hljs-number">0</span>) {
    <span class="hljs-keyword">throw</span> <span class="hljs-keyword">new</span> IllegalArgumentException(<span
                            class="hljs-string">"seconds value is invalid!"</span>);
  }
  <span class="hljs-keyword">synchronized</span> (<span class="hljs-keyword">this</span>) {
    setSeconds(getRemainingSeconds() - seconds);
  }
}
</div></code></pre>
            </li>
        </ul>
        <p>as you can see the synchronized part is just the part where the data is modified not the whole class, if i
            synchronized the whole function that would be bad for performance</p>
        <p>now let's look at <code>getRemainingSeconds()</code></p>
        <pre class="hljs"><code><div>  <span class="hljs-function"><span class="hljs-keyword">public</span> <span
                class="hljs-keyword">synchronized</span> <span class="hljs-keyword">int</span> <span class="hljs-title">getRemainingSeconds</span><span
                class="hljs-params">()</span> </span>{
    <span class="hljs-keyword">return</span> seconds;
  }
</div></code></pre>
        <p>I did synchronize the whole function since it's just one line, but in my first version of the code, I didn't
            synchronize this get function at all, but after reading this part from &quot;Java concurrency in Practice&quot;
            book chapter 3 &quot;sharing objects&quot; :
            &quot;Synchronizing only the setter would not be sufficient: threads calling get would still be able to see
            stale values&quot;</p>
        <p>And this is how I solved my concurrency issues</p>
        <h2 id="data-structures-i-used-and-why"><strong>Data structures I used and why</strong></h2>
        <p>There are these rules in Joshua's "Effective Java" book that effected what data structures to use</p>
        <ul>
            <li>
                <p>Item 25: <strong>Prefer lists to arrays</strong></p>
                <ul>
                    <li>
                        <p>This is why you will not see any arrays in my code, I just used ArrayList since it's easier
                            to deal with and has more functionality</p>
                        <pre class="hljs"><code><div><span class="hljs-keyword">private</span> ArrayList&lt;Item&gt; itemList;<span
                                class="hljs-comment">//inside itemStatus class</span>
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">private</span> ArrayList&lt;MapLoader&gt; maps;<span
                                class="hljs-comment">//inside GameDriver class</span>
<span class="hljs-keyword">private</span> ArrayList&lt;Mode&gt; modes;
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">private</span> ArrayList&lt;Command&gt; commands;<span
                                class="hljs-comment">//inside Mode class</span>
</div></code></pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Item 33: <strong>Use EnumMap instead of ordinal indexing</strong></p>
                <ul>
                    <li>
                        <p>I have one data structure type in my code that deals with enum types and it's
                            <strong>EnumMap</strong>, since it's more efficient than any type of maps when it comes to
                            make the key in the map enum type</p>
                        <pre class="hljs"><code><div><span class="hljs-comment">//inside Room class</span>
<span class="hljs-comment">// ex : roomObjects.get(NORTH) gives us the roomObject on the northern wall</span>
<span class="hljs-keyword">private</span> EnumMap&lt;Direction, RoomObject&gt; roomObjects;
</div></code></pre>
                        <pre class="hljs"><code><div><span class="hljs-keyword">private</span> EnumMap&lt;Direction, Room&gt; nextRoom;<span
                                class="hljs-comment">//inside EntryWay class</span>
</div></code></pre>
                    </li>
                </ul>
            </li>
        </ul>

        </body>
    </div>


</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"
></script>
<script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"
></script>
<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"
></script>


</body>
</html>