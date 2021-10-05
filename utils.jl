function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end

"""
Create a photo gallery containing all images in `tdd-pics` directory.
Allowed formats are png, jpeg, jpg.
"""
Franklin.@delay function hfun_gallery()
    # gather list of relative paths to pictures
    rpaths = [joinpath("/tdd-pics", pn) for pn in readdir("tdd-pics") if endswith(pn, r".png|.jpeg|.jpg")]

    # start writing the html for gallery container
    io = IOBuffer()
    write(io, "<div class=\"gallery_container\">")

    # create gallery photo divs
    for rp in rpaths
        alt_text = splitext(rp)[1][10:end]
        write(io, """
            <div class=\"gallery\">
                <a target=\"_blank\" href=$rp>
                    <img src=$rp alt=$alt_text width=\"600\" height=\"400\">
                </a>
            </div>
            """)
    end

    # finish writing html for gallery contatiner
    write(io, "</div>")

    # pass html to render page
    return String(take!(io))
end
