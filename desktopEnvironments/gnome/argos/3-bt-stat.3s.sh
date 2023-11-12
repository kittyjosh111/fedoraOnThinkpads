#!/bin/bash
# Link to Argos: https://github.com/p-e-w/argos
# Feel nostalgia for old status icons? This script adds in an icon that changes color based on bluetooth status

## Vars
rfOut=$(rfkill) #used for both bt and network stuff
bt=$(echo "$rfOut" | grep bluetooth | grep " blocked") #value if blocked (off)

## Conditionals
if [[ -z "$bt" ]]; then
    image="iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAA0GVYSWZJSSoACAAAAAoAAAEEAAEAAAAyAAAAAQEEAAEAAAAyAAAAAgEDAAMAAACGAAAAEgEDAAEAAAABAAAAGgEFAAEAAACMAAAAGwEFAAEAAACUAAAAKAEDAAEAAAADAAAAMQECAA0AAACcAAAAMgECABQAAACqAAAAaYcEAAEAAAC+AAAAAAAAAAgACAAIADcCAAAUAAAANwIAABQAAABHSU1QIDIuMTAuMzQAADIwMjM6MTE6MDkgMTA6Mjk6MzgAAQABoAMAAQAAAAEAAAAAAAAAY3wqkQAAAYVpQ0NQSUNDIHByb2ZpbGUAAHicfZE9SMNAHMVfW6V+VAQtIuKQoTpZEBVx1CoUoUKoFVp1MLn0C5o0JCkujoJrwcGPxaqDi7OuDq6CIPgB4uripOgiJf4vKbSI8eC4H+/uPe7eAf5aialm2zigapaRjMeEdGZVCL6iG53owwCCEjP1OVFMwHN83cPH17soz/I+9+foUbImA3wC8SzTDYt4g3h609I57xOHWUFSiM+Jxwy6IPEj12WX3zjnHfbzzLCRSs4Th4mFfAvLLcwKhko8RRxRVI3y/WmXFc5bnNVShTXuyV8Yymory1ynOYw4FrEEEQJkVFBECRaitGqkmEjSfszDP+T4RXLJ5CqCkWMBZaiQHD/4H/zu1sxNTrhJoRjQ/mLbHyNAcBeoV237+9i26ydA4Bm40pr+cg2Y+SS92tQiR0DvNnBx3dTkPeByBxh80iVDcqQATX8uB7yf0TdlgP5boGvN7a2xj9MHIEVdJW6Ag0NgNE/Z6x7v7mjt7d8zjf5+ABltcoMsDuxBAAANeGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNC40LjAtRXhpdjIiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iCiAgICB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIgogICAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIgogICAgeG1sbnM6R0lNUD0iaHR0cDovL3d3dy5naW1wLm9yZy94bXAvIgogICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCiAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iCiAgIHhtcE1NOkRvY3VtZW50SUQ9ImdpbXA6ZG9jaWQ6Z2ltcDplZjYwOWI2Yy00ODk2LTQ0YmQtYjBlZi04OTYyNTI5YzEwYTEiCiAgIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTJlZDkzMTEtNWYwZC00NzA1LTg2MjMtZTk5N2VmZTY0NzkzIgogICB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6YTY0YWJkZjktZWIyNS00OThkLWFiZmEtZGViMDU3YjlkNTMxIgogICBkYzpGb3JtYXQ9ImltYWdlL3BuZyIKICAgR0lNUDpBUEk9IjIuMCIKICAgR0lNUDpQbGF0Zm9ybT0iTGludXgiCiAgIEdJTVA6VGltZVN0YW1wPSIxNjk5NTU0NTc4NDEwNTYxIgogICBHSU1QOlZlcnNpb249IjIuMTAuMzQiCiAgIHRpZmY6T3JpZW50YXRpb249IjEiCiAgIHhtcDpDcmVhdG9yVG9vbD0iR0lNUCAyLjEwIgogICB4bXA6TWV0YWRhdGFEYXRlPSIyMDIzOjExOjA5VDEwOjI5OjM4LTA4OjAwIgogICB4bXA6TW9kaWZ5RGF0ZT0iMjAyMzoxMTowOVQxMDoyOTozOC0wODowMCI+CiAgIDx4bXBNTTpIaXN0b3J5PgogICAgPHJkZjpTZXE+CiAgICAgPHJkZjpsaQogICAgICBzdEV2dDphY3Rpb249InNhdmVkIgogICAgICBzdEV2dDpjaGFuZ2VkPSIvIgogICAgICBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOmU1ODYzOGIyLTM5ZGEtNDViZi05MWUzLTY0OTczNjQ1Nzg0MCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iR2ltcCAyLjEwIChMaW51eCkiCiAgICAgIHN0RXZ0OndoZW49IjIwMjMtMTEtMDlUMTA6Mjk6MzgtMDg6MDAiLz4KICAgIDwvcmRmOlNlcT4KICAgPC94bXBNTTpIaXN0b3J5PgogIDwvcmRmOkRlc2NyaXB0aW9uPgogPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgIAo8P3hwYWNrZXQgZW5kPSJ3Ij8+7I57wwAAAAZiS0dEAP8AAAAAMyd88wAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB+cLCRIdJv+OYf4AAAPoSURBVGjexZpbiFVVGMd/Wx2bmSRCvFTmpUgiTSsYU4lIwZ6SHoQefBB6ydQHp8k3L2hpwihBSWIgBWmOIhhKJZHiBSkqU5oaTChnNPMShI63MXU8/x5mec5Wp2mtb61zZi+Gfc7svf57/c5a+/u+9a2VEXuIDKgDnnPnR4BRQA1wv7urHbgKHAfagIPAN8AhMkSvHmIIYgXiODKXNsRyxODeAOiPeBtxJQLgznIZsQzRv1IQoxDNCQHuLD8hRpYb4knEmcCGnTDAnEaMLRfEg8ZGPYY4Zaj3J+Lh1BB9EHtNA6Wr/uOIs4bae5xFTAYyzzziSxrPIM4bFF5PBXEv4q9okC6tSYiLgQpnELUpQBZE2aCSzgh3noroCFR5IwXIr4lAfkM85D6/iPgnQOVoLMTkaK9Q0hKiBTHIfZ+BuBGgNOH/mtunh2vTExvxscBuxEAyPgNmAjc9674U0yM/Ju6RW+VbxAD3/9cQBQ+l760QtZ5df80AcstH1Lhr9R7PuY6oLtf78TNiJGKXAUSInYgqd32hx/MmWt6Rpzxwm8g4AbwMfGXo91ag03nvoR73j7f0yCqPX6iAqM+F9tsDemQdInN/azzfuJUWkK2e4gVEQw5mhwfIu8WZpfgwwHRssYDsC7RPi1y9KsS2HkBW5yDWBj5jf6VM7xJXty/i025AGnPR9McG/ZZKhiaLXf1+iKac3ls5yE+M2qctIH9EuMFlxUbfrtkXsSlC94IF5FykT2/sBmJjpGaHBeRagkTCCzm92Qn0Oi0g1yMfuvCuJJ74oDdArEOrUJwI5XNUJee3rtJD66QRYv5tnr6kl/fk7xtB2ithfguIua5uNeLLbvzI2hzMe5UyvwcDIea5evcgPu/Bs69HLlAV7wSC/FLOECXfEzWIrz1irY9yMMsDQPaVK2jsRLyam4jtCoh+mxD9il7fD2SzBaTRQ7ghl/vaa5hYbSh6fz+YlZaJVasH7hzEaGAnMMUwsar+j89EtMmcCrphnLN/UfQzYqnns561gNQE5p1CQEITDxHJh3AT7AuSTwXN9UwFCfFdTF5rRWKQZsRA930W4mbw1MAIMikhyJHigqd4xZnukFIXm/89mghkmDtPN0TWLUQf4s0kIF1a0xBXDSr1qRZ6zibokcmISwaFRAs9XY2YEwUi6hDtRoXZKdcQs7uCQf8yDvG3sW7ixdC45WnrsGxDPFCutfYxxjVzyxr7E+Xe/TACcbiMEIcQwyu1H6XKBXqXEwJcQiwurpdUeJfQYDePOBYB8LvbFTQotjlZIqingeeBCcCjbuNZLXCfu+Mi0OE2nrUCPwAHyGhO9bv+CyvQp/kWy7hbAAAAAElFTkSuQmCC"
else
    image="iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAA0GVYSWZJSSoACAAAAAoAAAEEAAEAAAAyAAAAAQEEAAEAAAAyAAAAAgEDAAMAAACGAAAAEgEDAAEAAAABAAAAGgEFAAEAAACMAAAAGwEFAAEAAACUAAAAKAEDAAEAAAADAAAAMQECAA0AAACcAAAAMgECABQAAACqAAAAaYcEAAEAAAC+AAAAAAAAAAgACAAIADcCAAAUAAAANwIAABQAAABHSU1QIDIuMTAuMzQAADIwMjM6MTE6MDkgMTA6Mjg6MTgAAQABoAMAAQAAAAEAAAAAAAAAHMvBOAAAAYVpQ0NQSUNDIHByb2ZpbGUAAHicfZE9SMNAHMVfW6V+VAQtIuKQoTpZEBVx1CoUoUKoFVp1MLn0C5o0JCkujoJrwcGPxaqDi7OuDq6CIPgB4uripOgiJf4vKbSI8eC4H+/uPe7eAf5aialm2zigapaRjMeEdGZVCL6iG53owwCCEjP1OVFMwHN83cPH17soz/I+9+foUbImA3wC8SzTDYt4g3h609I57xOHWUFSiM+Jxwy6IPEj12WX3zjnHfbzzLCRSs4Th4mFfAvLLcwKhko8RRxRVI3y/WmXFc5bnNVShTXuyV8Yymory1ynOYw4FrEEEQJkVFBECRaitGqkmEjSfszDP+T4RXLJ5CqCkWMBZaiQHD/4H/zu1sxNTrhJoRjQ/mLbHyNAcBeoV237+9i26ydA4Bm40pr+cg2Y+SS92tQiR0DvNnBx3dTkPeByBxh80iVDcqQATX8uB7yf0TdlgP5boGvN7a2xj9MHIEVdJW6Ag0NgNE/Z6x7v7mjt7d8zjf5+ABltcoMsDuxBAAANeGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNC40LjAtRXhpdjIiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iCiAgICB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIgogICAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIgogICAgeG1sbnM6R0lNUD0iaHR0cDovL3d3dy5naW1wLm9yZy94bXAvIgogICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCiAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iCiAgIHhtcE1NOkRvY3VtZW50SUQ9ImdpbXA6ZG9jaWQ6Z2ltcDoyNWQ4ZTQzYy0zODgwLTQzN2ItOWYxZi03ZTlhNjM2YmE4YTAiCiAgIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OGNkZGI0MDYtMGU2Zi00NTUyLWI1ZDMtN2Y2YTBhMmMxMDEwIgogICB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6ZDVmY2I1MzItMWFmZS00YWZkLTk3NGYtYmZmN2M3NjEwYjJiIgogICBkYzpGb3JtYXQ9ImltYWdlL3BuZyIKICAgR0lNUDpBUEk9IjIuMCIKICAgR0lNUDpQbGF0Zm9ybT0iTGludXgiCiAgIEdJTVA6VGltZVN0YW1wPSIxNjk5NTU0NDk4NTgxOTY0IgogICBHSU1QOlZlcnNpb249IjIuMTAuMzQiCiAgIHRpZmY6T3JpZW50YXRpb249IjEiCiAgIHhtcDpDcmVhdG9yVG9vbD0iR0lNUCAyLjEwIgogICB4bXA6TWV0YWRhdGFEYXRlPSIyMDIzOjExOjA5VDEwOjI4OjE4LTA4OjAwIgogICB4bXA6TW9kaWZ5RGF0ZT0iMjAyMzoxMTowOVQxMDoyODoxOC0wODowMCI+CiAgIDx4bXBNTTpIaXN0b3J5PgogICAgPHJkZjpTZXE+CiAgICAgPHJkZjpsaQogICAgICBzdEV2dDphY3Rpb249InNhdmVkIgogICAgICBzdEV2dDpjaGFuZ2VkPSIvIgogICAgICBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjU2ZDFhYWJlLWU3MmUtNGEzNy1iN2I5LTJlNDU0NjA2ZjZkNiIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iR2ltcCAyLjEwIChMaW51eCkiCiAgICAgIHN0RXZ0OndoZW49IjIwMjMtMTEtMDlUMTA6Mjg6MTgtMDg6MDAiLz4KICAgIDwvcmRmOlNlcT4KICAgPC94bXBNTTpIaXN0b3J5PgogIDwvcmRmOkRlc2NyaXB0aW9uPgogPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgIAo8P3hwYWNrZXQgZW5kPSJ3Ij8+sVx/wgAAAAZiS0dEAP8AAAAAMyd88wAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB+cLCRIcEschpAoAAAP9SURBVGjexZpdiFZFGMf/s7q2u0VEqFmZWhRR9glrJSF2UVctBUEXXQTduK1eZN6akWUJWwQVSpEU9OEWRVFUYhppRGL5QZqUUO1q5UcQtelmqdv762LnwLBsOvPMnHcHlvfd95znP/M7M+d5Zp4Zp8wCOEmdkm72nxdLmiWpXdI5/rZBSX9L2idpQNI2SV9I2uGcQ+NZgKnA48A+7GUAWAFMGQ+AScBjwF+UK0PAcmBSsyBmAbuor3wNzKwb4irgUGLD9htgDgKz64I439ioS4EDBrtfgOmlIVqATZZx4u0vBw4bzD/1HrEYyCLrgA80rgf+MEjcXwriTODXXBCvdRNwJFHiENAR09aW01zvkTS1wAOZ4ZzbKulOHxhjyzRJ3SV65LscXxrofA9c4L/fBvyTILM3F2JublAItAD2AJP9/3cBJxOk5uQMra7CXny2pE+Ac51z70q6R9K/kba35/TI9sI9UpUtwFn+9wVAI0LqSytER2TXHzeAVDGi3V9bHFHPCaCtrvdjNzAT2GgAAVgHtPrrSyPqu9HyjlwbwdvnnNsv6Q5J6w0d3y9p2Efv8yLuv8bSI09GPKEGsDiY2r+X0CPPA87/PRf5yq20gLwVKd4AlgQw70eAPF2tLIEXEnzHmxaQzYkO6iFv1wq8cwqQpwKI1Yl1fNYs1/uwt50AvD4GSG8wm37ZoL+nmVOTZd5+ItAX6D0aQL5i1D5oAfkpIw4urxo9SnMCsDZD908LyO+ZQb13DIjXMjWPWUCOF0gkzA/0ugvoDVtATmRWunR0Eg9YNR4g1qHVAB6s4sooEOcDYVOH1s9GiAfCSB/ohZH8WSPIYDPcbwNY6G3bgI/GiCOrA5hnmuV+tyVCLPJ2ZwAfnCKyrwFa/G9PJIJ8U+cUJeyJdmBDxFzrpQBmRQLI5romjcPAfcFCbGPC7LcPmFhF/UiQNywgvRHCS4Lc1ybDwurVKvpHwqy0LKz6I3h7gMskrZN0i2Fh1fY/35XRJnMq6KRxzf5hFWeARyLrusEC0p6Yd0oBSU082JMPBhccCxKmghZGpoIAtuYk6D4unKDbLanLOTcE3CtplaTYbYP15lp99rxUj3xbbXgCd3vXnVI6c/O/ewuBXOg/uwwz66gl7um2FV4sMaaccweAWyW9Lak10XxNqY2ewwV6ZC5w1CARvdETA9OTAwJ0AoNGie5irsZPuzcYG3I18JvRtuxmaOb2tHVYDgDT6tprv9K4Z27ZY7+i7tMPM4CdNULsAC5q1nmUVj/RGyoIcBRYVu2XNPuU0BS/jvgxA+AHRk4FTc6OVYWgrpM0T9IcSZdo5OBZh6Sz/S1HJB3TyMGzfklfSfrcOber1IP9D+EkZ/ZGhFcMAAAAAElFTkSuQmCC"
fi

## Display echo
echo -e " | image=$image imageWidth=18"
echo "---"

## Argos click menu thing
if [ "$ARGOS_MENU_OPEN" == "true" ]; then
    if [[ -z "$bt" ]]; then
        echo "Bluetooth On"
    else
        echo "Bluetooth Off"
    fi
else
    echo "Loading..."
fi