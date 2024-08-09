# Tmux

REF: https://github.com/tmux/tmux/wiki/Getting-Started<br>
REF: https://arcolinux.com/everthing-you-need-to-know-about-tmux-servers-and-sessions/

## Using Tmux Interactively

- **Create a new session:**

```bash
tmux new-session # or tmux new
```

- **Create a new session specifying a name:**

```bash
tmux new-session -s myfirstsession
```

- **Create a new session of Tmux and open a program other than shell:**

```bash
tmux new-session 'nvim ~/.bashrc'
# OR
tmux new-session -- nvim ~/.bashrc
```

- **Specify a name to the window using the `-n` flag:**

```bash
tmux new-session -s mysession -n mywindow top
```
The above a command opens a new Tmux session named "mysession", with a new window named "mywindow" running `top`. [Check out more flags for `new-session`](https://man.openbsd.org/tmux#new-session).

## The Status Line

<img alt="Tmux Status" src="https://raw.githubusercontent.com/wiki/tmux/tmux/images/tmux_status_line_diagram.png">

As new windows are opened, the window list grows. If there are too many windows to fit on the width of the terminal, a `<` or `>` will be added at the left or right or both to show there are hidden windows.

## The Prefix Key

- Once a tmux client is attached, any keys entered are forwarded to the program running in the active pane of the current window.
- For keys that control Tmux itself, a special key must be pressed first - this is called the **Prefix key**.
<br><br>
- The default prefix key is `C-b`, which means the `Ctrl` key and `b` (pressed together).
- In Tmux, modifier keys are shown by prefixing a key with `C-` for the control key, `M-` for the meta key (normally Alt on modern computers) and `S-` for the shift key. 
- These may be combined together, so `C-M-x` means pressing the control key, meta key and x together.
<br><br>
- When the Prefix key is pressed, Tmux waits for another key press and that determines what tmux command is executed. 
- Keys like this are shown here with a space between them: `C-b c` means first the Prefix key `C-b` is pressed, then it is released and then the `c` key is pressed. Care must be taken to release the `Ctrl` key after pressing `C-b` if necessary 

> [!note] 
> `C-b c` is different from `C-b C-c`.

> [!tip]
> Pressing `C-b` twice sends the `C-b` key to the program running in the active pane.

## Help Keys

- Every *default* Tmux key binding has a short description to help remember what the key does. 
- A list of all the keys can be seen by pressing `C-b ?`.
<br><br>
- `C-b ?` enters <u>View mode</u> to show text.
- Alternatively, the same list can be seen from the shell by running:

```bash
tmux lsk -N | less
```

- `C-b /` shows the description of a single key - a prompt at the bottom of the terminal appears. Pressing a key will show its description in the same place. 

## The Command Prompt

- Tmux has an interactive command prompt. This can be opened by pressing `C-b :` and appears instead of the status line.
- By default, the command prompt uses keys similar to *emacs(1)*; however, if the `VISUAL` or `EDITOR` environment variables are set to something containing `vi` (such as `vi` or `vim` or `nvi`), then *vi(1)*-style keys are used instead.
- Multiple commands may be entered together at the command prompt by separating them with a semicolon (`;`). This is called a <u>Command Sequence</u>.

## Attaching & Detaching

- Detaching from Tmux means that the client exits and detaches from the outside terminal, returning to the shell and leaving the Tmux session and any programs inside it running in the *background*. 
- To detach Tmux, the `C-b d` key binding is used.
- When Tmux detaches, it will print a message with the session name.
<br><br>
- The `attach-session` command attaches to an existing session. Without arguments, it will attach to the most recently used session that is not already attached:

```bash
tmux attach
```

- Or use `-t` to give the name of the session to attach to:

```bash
tmux attach -t mysession
```

- By default, attaching to a session does not detach any other clients attached to the same session. The `-d` flag does this:

```bash
tmux attach -d mysession
```

This command attaches to a tmux session named "mysession" and detaches any existing clients that may be attached to it.

<details>
    <summary><b>What's the difference between client and session here?</b></summary>
    <br>In tmux, a session is a collection of pseudo-terminals (think of them as virtual terminals) that are connected together. A session can have multiple windows and panes, and each window can have its own shell or program running.<br><br>
    A client, on the other hand, is a program that connects to a tmux session. When you run tmux attach, you are creating a new client that connects to an existing session. Multiple clients can be connected to the same session at the same time, allowing multiple people to collaborate on the same session or allowing you to connect to the same session from multiple devices.<br><br>
    Think of it like a chat room:
    - The session is the chat room itself, where all the conversation happens.
    - A client is like a person who joins the chat room. They can see the conversation, participate in it, and leave the room when they're done.
    <br><br>When you run <code>tmux attach -d</code>, you're essentially "kicking out" any existing clients (people) from the chat room (session) before joining it yourself.
</details>

- The `new-session` command has a `-A` flag to attach to an existing session if it exists, or create a new one if it does not. For a session named `mysession`:

```bash
tmux new -A mysession
```

## Listing Sessions

- The `list-session` command (alias `ls`) shows a list of available sessions that can be attached. 
    - This shows four sessions called 1, 2, myothersession and mysession:
    ```bash
    $ tmux ls
    1: 3 windows (created Sat Feb 22 11:44:51 2020)
    2: 1 windows (created Sat Feb 22 11:44:51 2020)
    myothersession: 2 windows (created Sat Feb 22 11:44:51 2020)
    mysession: 1 windows (created Sat Feb 22 11:44:51 2020)
    ```
