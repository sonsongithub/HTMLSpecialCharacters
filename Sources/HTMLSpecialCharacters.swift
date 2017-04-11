//
//  HTMLSpecialCharacters.swift
//  HTMLSpecialCharacters
//
//  Created by sonson on 2017/02/08.
//  Copyright © 2017年 sonson. All rights reserved.
//

import Foundation

// MARK: - Table for unescaping

// Structure as LUT(look up table)
private struct HtmlUnescapeMap {
    let unescapingCodes: [unichar]
    let code: unichar
    init(_ u: [unichar], _ c: unichar) {
        unescapingCodes = u
        code = c
    }
}

/**
 Get array of HtmlUnescapeMap according to the length of HTML code.
 - parameter length: The length of HTML code to be unescaped.
 - returns: Array of HtmlUnescapeMap.
 */
private func getUnescapeTable(length: Int) -> [HtmlUnescapeMap]? {
    switch length {
    case 2:
        return unicodeHtmlUnescapeMapNameLength_2
    case 3:
        return unicodeHtmlUnescapeMapNameLength_3
    case 4:
        return unicodeHtmlUnescapeMapNameLength_4
    case 5:
        return unicodeHtmlUnescapeMapNameLength_5
    case 6:
        return unicodeHtmlUnescapeMapNameLength_6
    case 7:
        return unicodeHtmlUnescapeMapNameLength_7
    case 8:
        return unicodeHtmlUnescapeMapNameLength_8
    default:
        return nil
    }
}

private let unicodeHtmlUnescapeMapNameLength_2: [HtmlUnescapeMap] = [
	HtmlUnescapeMap([108, 116], 60), // "lt" => "<"
	HtmlUnescapeMap([103, 116], 62), // "gt" => ">"
	HtmlUnescapeMap([77, 117], 924), // "Mu" => "Μ"
	HtmlUnescapeMap([78, 117], 925), // "Nu" => "Ν"
	HtmlUnescapeMap([88, 105], 926), // "Xi" => "Ξ"
	HtmlUnescapeMap([80, 105], 928), // "Pi" => "Π"
	HtmlUnescapeMap([109, 117], 956), // "mu" => "μ"
	HtmlUnescapeMap([110, 117], 957), // "nu" => "ν"
	HtmlUnescapeMap([120, 105], 958), // "xi" => "ξ"
	HtmlUnescapeMap([112, 105], 960), // "pi" => "π"
	HtmlUnescapeMap([110, 105], 8715), // "ni" => "∋"
	HtmlUnescapeMap([111, 114], 8744), // "or" => "∨"
	HtmlUnescapeMap([110, 101], 8800), // "ne" => "≠"
	HtmlUnescapeMap([108, 101], 8804), // "le" => "≤"
	HtmlUnescapeMap([103, 101], 8805)  // "ge" => "≥"
]

private let unicodeHtmlUnescapeMapNameLength_3: [HtmlUnescapeMap] = [
	HtmlUnescapeMap([97, 109, 112], 38), // "amp" => "&"
	HtmlUnescapeMap([121, 101, 110], 165), // "yen" => "¥"
	HtmlUnescapeMap([117, 109, 108], 168), // "uml" => "¨"
	HtmlUnescapeMap([110, 111, 116], 172), // "not" => "¬"
	HtmlUnescapeMap([115, 104, 121], 173), // "shy" => "­"
	HtmlUnescapeMap([114, 101, 103], 174), // "reg" => "®"
	HtmlUnescapeMap([100, 101, 103], 176), // "deg" => "°"
	HtmlUnescapeMap([69, 84, 72], 208), // "ETH" => "Ð"
	HtmlUnescapeMap([101, 116, 104], 240), // "eth" => "ð"
	HtmlUnescapeMap([69, 116, 97], 919), // "Eta" => "Η"
	HtmlUnescapeMap([82, 104, 111], 929), // "Rho" => "Ρ"
	HtmlUnescapeMap([84, 97, 117], 932), // "Tau" => "Τ"
	HtmlUnescapeMap([80, 104, 105], 934), // "Phi" => "Φ"
	HtmlUnescapeMap([67, 104, 105], 935), // "Chi" => "Χ"
	HtmlUnescapeMap([80, 115, 105], 936), // "Psi" => "Ψ"
	HtmlUnescapeMap([101, 116, 97], 951), // "eta" => "η"
	HtmlUnescapeMap([114, 104, 111], 961), // "rho" => "ρ"
	HtmlUnescapeMap([116, 97, 117], 964), // "tau" => "τ"
	HtmlUnescapeMap([112, 104, 105], 966), // "phi" => "φ"
	HtmlUnescapeMap([99, 104, 105], 967), // "chi" => "χ"
	HtmlUnescapeMap([112, 115, 105], 968), // "psi" => "ψ"
	HtmlUnescapeMap([112, 105, 118], 982), // "piv" => "ϖ"
	HtmlUnescapeMap([122, 119, 106], 8205), // "zwj" => "‍"
	HtmlUnescapeMap([108, 114, 109], 8206), // "lrm" => "‎"
	HtmlUnescapeMap([114, 108, 109], 8207), // "rlm" => "‏"
	HtmlUnescapeMap([115, 117, 109], 8721), // "sum" => "∑"
	HtmlUnescapeMap([97, 110, 103], 8736), // "ang" => "∠"
	HtmlUnescapeMap([97, 110, 100], 8743), // "and" => "∧"
	HtmlUnescapeMap([99, 97, 112], 8745), // "cap" => "∩"
	HtmlUnescapeMap([99, 117, 112], 8746), // "cup" => "∪"
	HtmlUnescapeMap([105, 110, 116], 8747), // "int" => "∫"
	HtmlUnescapeMap([115, 105, 109], 8764), // "sim" => "∼"
	HtmlUnescapeMap([115, 117, 98], 8834), // "sub" => "⊂"
	HtmlUnescapeMap([115, 117, 112], 8835), // "sup" => "⊃"
	HtmlUnescapeMap([108, 111, 122], 9674) // "loz" => "◊"
]

private let unicodeHtmlUnescapeMapNameLength_4: [HtmlUnescapeMap] = [
	HtmlUnescapeMap([113, 117, 111, 116], 34), // "quot" => """
	HtmlUnescapeMap([97, 112, 111, 115], 39), // "apos" => "'"
	HtmlUnescapeMap([110, 98, 115, 112], 160), // "nbsp" => " "
	HtmlUnescapeMap([99, 101, 110, 116], 162), // "cent" => "¢"
	HtmlUnescapeMap([115, 101, 99, 116], 167), // "sect" => "§"
	HtmlUnescapeMap([99, 111, 112, 121], 169), // "copy" => "©"
	HtmlUnescapeMap([111, 114, 100, 102], 170), // "ordf" => "ª"
	HtmlUnescapeMap([109, 97, 99, 114], 175), // "macr" => "¯"
	HtmlUnescapeMap([115, 117, 112, 50], 178), // "sup2" => "²"
	HtmlUnescapeMap([115, 117, 112, 51], 179), // "sup3" => "³"
	HtmlUnescapeMap([112, 97, 114, 97], 182), // "para" => "¶"
	HtmlUnescapeMap([115, 117, 112, 49], 185), // "sup1" => "¹"
	HtmlUnescapeMap([111, 114, 100, 109], 186), // "ordm" => "º"
	HtmlUnescapeMap([65, 117, 109, 108], 196), // "Auml" => "Ä"
	HtmlUnescapeMap([69, 117, 109, 108], 203), // "Euml" => "Ë"
	HtmlUnescapeMap([73, 117, 109, 108], 207), // "Iuml" => "Ï"
	HtmlUnescapeMap([79, 117, 109, 108], 214), // "Ouml" => "Ö"
	HtmlUnescapeMap([85, 117, 109, 108], 220), // "Uuml" => "Ü"
	HtmlUnescapeMap([97, 117, 109, 108], 228), // "auml" => "ä"
	HtmlUnescapeMap([101, 117, 109, 108], 235), // "euml" => "ë"
	HtmlUnescapeMap([105, 117, 109, 108], 239), // "iuml" => "ï"
	HtmlUnescapeMap([111, 117, 109, 108], 246), // "ouml" => "ö"
	HtmlUnescapeMap([117, 117, 109, 108], 252), // "uuml" => "ü"
	HtmlUnescapeMap([121, 117, 109, 108], 255), // "yuml" => "ÿ"
	HtmlUnescapeMap([89, 117, 109, 108], 376), // "Yuml" => "Ÿ"
	HtmlUnescapeMap([102, 110, 111, 102], 402), // "fnof" => "ƒ"
	HtmlUnescapeMap([99, 105, 114, 99], 710), // "circ" => "ˆ"
	HtmlUnescapeMap([66, 101, 116, 97], 914), // "Beta" => "Β"
	HtmlUnescapeMap([90, 101, 116, 97], 918), // "Zeta" => "Ζ"
	HtmlUnescapeMap([73, 111, 116, 97], 921), // "Iota" => "Ι"
	HtmlUnescapeMap([98, 101, 116, 97], 946), // "beta" => "β"
	HtmlUnescapeMap([122, 101, 116, 97], 950), // "zeta" => "ζ"
	HtmlUnescapeMap([105, 111, 116, 97], 953), // "iota" => "ι"
	HtmlUnescapeMap([101, 110, 115, 112], 8194), // "ensp" => " "
	HtmlUnescapeMap([101, 109, 115, 112], 8195), // "emsp" => " "
	HtmlUnescapeMap([122, 119, 110, 106], 8204), // "zwnj" => "‌"
	HtmlUnescapeMap([98, 117, 108, 108], 8226), // "bull" => "•"
	HtmlUnescapeMap([101, 117, 114, 111], 8364), // "euro" => "€"
	HtmlUnescapeMap([114, 101, 97, 108], 8476), // "real" => "ℜ"
	HtmlUnescapeMap([108, 97, 114, 114], 8592), // "larr" => "←"
	HtmlUnescapeMap([117, 97, 114, 114], 8593), // "uarr" => "↑"
	HtmlUnescapeMap([114, 97, 114, 114], 8594), // "rarr" => "→"
	HtmlUnescapeMap([100, 97, 114, 114], 8595), // "darr" => "↓"
	HtmlUnescapeMap([104, 97, 114, 114], 8596), // "harr" => "↔"
	HtmlUnescapeMap([108, 65, 114, 114], 8656), // "lArr" => "⇐"
	HtmlUnescapeMap([117, 65, 114, 114], 8657), // "uArr" => "⇑"
	HtmlUnescapeMap([114, 65, 114, 114], 8658), // "rArr" => "⇒"
	HtmlUnescapeMap([100, 65, 114, 114], 8659), // "dArr" => "⇓"
	HtmlUnescapeMap([104, 65, 114, 114], 8660), // "hArr" => "⇔"
	HtmlUnescapeMap([112, 97, 114, 116], 8706), // "part" => "∂"
	HtmlUnescapeMap([105, 115, 105, 110], 8712), // "isin" => "∈"
	HtmlUnescapeMap([112, 114, 111, 100], 8719), // "prod" => "∏"
	HtmlUnescapeMap([112, 114, 111, 112], 8733), // "prop" => "∝"
	HtmlUnescapeMap([99, 111, 110, 103], 8773), // "cong" => "≅"
	HtmlUnescapeMap([110, 115, 117, 98], 8836), // "nsub" => "⊄"
	HtmlUnescapeMap([115, 117, 98, 101], 8838), // "sube" => "⊆"
	HtmlUnescapeMap([115, 117, 112, 101], 8839), // "supe" => "⊇"
	HtmlUnescapeMap([112, 101, 114, 112], 8869), // "perp" => "⊥"
	HtmlUnescapeMap([115, 100, 111, 116], 8901), // "sdot" => "⋅"
	HtmlUnescapeMap([108, 97, 110, 103], 9001), // "lang" => "〈"
	HtmlUnescapeMap([114, 97, 110, 103], 9002) // "rang" => "〉"
]

private let unicodeHtmlUnescapeMapNameLength_5: [HtmlUnescapeMap] = [
	HtmlUnescapeMap([105, 101, 120, 99, 108], 161), // "iexcl" => "¡"
	HtmlUnescapeMap([112, 111, 117, 110, 100], 163), // "pound" => "£"
	HtmlUnescapeMap([108, 97, 113, 117, 111], 171), // "laquo" => "«"
	HtmlUnescapeMap([97, 99, 117, 116, 101], 180), // "acute" => "´"
	HtmlUnescapeMap([109, 105, 99, 114, 111], 181), // "micro" => "µ"
	HtmlUnescapeMap([99, 101, 100, 105, 108], 184), // "cedil" => "¸"
	HtmlUnescapeMap([114, 97, 113, 117, 111], 187), // "raquo" => "»"
	HtmlUnescapeMap([65, 99, 105, 114, 99], 194), // "Acirc" => "Â"
	HtmlUnescapeMap([65, 114, 105, 110, 103], 197), // "Aring" => "Å"
	HtmlUnescapeMap([65, 69, 108, 105, 103], 198), // "AElig" => "Æ"
	HtmlUnescapeMap([69, 99, 105, 114, 99], 202), // "Ecirc" => "Ê"
	HtmlUnescapeMap([73, 99, 105, 114, 99], 206), // "Icirc" => "Î"
	HtmlUnescapeMap([79, 99, 105, 114, 99], 212), // "Ocirc" => "Ô"
	HtmlUnescapeMap([116, 105, 109, 101, 115], 215), // "times" => "×"
	HtmlUnescapeMap([85, 99, 105, 114, 99], 219), // "Ucirc" => "Û"
	HtmlUnescapeMap([84, 72, 79, 82, 78], 222), // "THORN" => "Þ"
	HtmlUnescapeMap([115, 122, 108, 105, 103], 223), // "szlig" => "ß"
	HtmlUnescapeMap([97, 99, 105, 114, 99], 226), // "acirc" => "â"
	HtmlUnescapeMap([97, 114, 105, 110, 103], 229), // "aring" => "å"
	HtmlUnescapeMap([97, 101, 108, 105, 103], 230), // "aelig" => "æ"
	HtmlUnescapeMap([101, 99, 105, 114, 99], 234), // "ecirc" => "ê"
	HtmlUnescapeMap([105, 99, 105, 114, 99], 238), // "icirc" => "î"
	HtmlUnescapeMap([111, 99, 105, 114, 99], 244), // "ocirc" => "ô"
	HtmlUnescapeMap([117, 99, 105, 114, 99], 251), // "ucirc" => "û"
	HtmlUnescapeMap([116, 104, 111, 114, 110], 254), // "thorn" => "þ"
	HtmlUnescapeMap([79, 69, 108, 105, 103], 338), // "OElig" => "Œ"
	HtmlUnescapeMap([111, 101, 108, 105, 103], 339), // "oelig" => "œ"
	HtmlUnescapeMap([116, 105, 108, 100, 101], 732), // "tilde" => "˜"
	HtmlUnescapeMap([65, 108, 112, 104, 97], 913), // "Alpha" => "Α"
	HtmlUnescapeMap([71, 97, 109, 109, 97], 915), // "Gamma" => "Γ"
	HtmlUnescapeMap([68, 101, 108, 116, 97], 916), // "Delta" => "Δ"
	HtmlUnescapeMap([84, 104, 101, 116, 97], 920), // "Theta" => "Θ"
	HtmlUnescapeMap([75, 97, 112, 112, 97], 922), // "Kappa" => "Κ"
	HtmlUnescapeMap([83, 105, 103, 109, 97], 931), // "Sigma" => "Σ"
	HtmlUnescapeMap([79, 109, 101, 103, 97], 937), // "Omega" => "Ω"
	HtmlUnescapeMap([97, 108, 112, 104, 97], 945), // "alpha" => "α"
	HtmlUnescapeMap([103, 97, 109, 109, 97], 947), // "gamma" => "γ"
	HtmlUnescapeMap([100, 101, 108, 116, 97], 948), // "delta" => "δ"
	HtmlUnescapeMap([116, 104, 101, 116, 97], 952), // "theta" => "θ"
	HtmlUnescapeMap([107, 97, 112, 112, 97], 954), // "kappa" => "κ"
	HtmlUnescapeMap([115, 105, 103, 109, 97], 963), // "sigma" => "σ"
	HtmlUnescapeMap([111, 109, 101, 103, 97], 969), // "omega" => "ω"
	HtmlUnescapeMap([117, 112, 115, 105, 104], 978), // "upsih" => "ϒ"
	HtmlUnescapeMap([110, 100, 97, 115, 104], 8211), // "ndash" => "–"
	HtmlUnescapeMap([109, 100, 97, 115, 104], 8212), // "mdash" => "—"
	HtmlUnescapeMap([108, 115, 113, 117, 111], 8216), // "lsquo" => "‘"
	HtmlUnescapeMap([114, 115, 113, 117, 111], 8217), // "rsquo" => "’"
	HtmlUnescapeMap([115, 98, 113, 117, 111], 8218), // "sbquo" => "‚"
	HtmlUnescapeMap([108, 100, 113, 117, 111], 8220), // "ldquo" => "“"
	HtmlUnescapeMap([114, 100, 113, 117, 111], 8221), // "rdquo" => "”"
	HtmlUnescapeMap([98, 100, 113, 117, 111], 8222), // "bdquo" => "„"
	HtmlUnescapeMap([112, 114, 105, 109, 101], 8242), // "prime" => "′"
	HtmlUnescapeMap([80, 114, 105, 109, 101], 8243), // "Prime" => "″"
	HtmlUnescapeMap([111, 108, 105, 110, 101], 8254), // "oline" => "‾"
	HtmlUnescapeMap([102, 114, 97, 115, 108], 8260), // "frasl" => "⁄"
	HtmlUnescapeMap([105, 109, 97, 103, 101], 8465), // "image" => "ℑ"
	HtmlUnescapeMap([116, 114, 97, 100, 101], 8482), // "trade" => "™"
	HtmlUnescapeMap([99, 114, 97, 114, 114], 8629), // "crarr" => "↵"
	HtmlUnescapeMap([101, 120, 105, 115, 116], 8707), // "exist" => "∃"
	HtmlUnescapeMap([101, 109, 112, 116, 121], 8709), // "empty" => "∅"
	HtmlUnescapeMap([110, 97, 98, 108, 97], 8711), // "nabla" => "∇"
	HtmlUnescapeMap([110, 111, 116, 105, 110], 8713), // "notin" => "∉"
	HtmlUnescapeMap([109, 105, 110, 117, 115], 8722), // "minus" => "−"
	HtmlUnescapeMap([114, 97, 100, 105, 99], 8730), // "radic" => "√"
	HtmlUnescapeMap([105, 110, 102, 105, 110], 8734), // "infin" => "∞"
	HtmlUnescapeMap([97, 115, 121, 109, 112], 8776), // "asymp" => "≈"
	HtmlUnescapeMap([101, 113, 117, 105, 118], 8801), // "equiv" => "≡"
	HtmlUnescapeMap([111, 112, 108, 117, 115], 8853), // "oplus" => "⊕"
	HtmlUnescapeMap([108, 99, 101, 105, 108], 8968), // "lceil" => "⌈"
	HtmlUnescapeMap([114, 99, 101, 105, 108], 8969), // "rceil" => "⌉"
	HtmlUnescapeMap([99, 108, 117, 98, 115], 9827), // "clubs" => "♣"
	HtmlUnescapeMap([100, 105, 97, 109, 115], 9830) // "diams" => "♦"
]

private let unicodeHtmlUnescapeMapNameLength_6: [HtmlUnescapeMap] = [
	HtmlUnescapeMap([99, 117, 114, 114, 101, 110], 164), // "curren" => "¤"
	HtmlUnescapeMap([98, 114, 118, 98, 97, 114], 166), // "brvbar" => "¦"
	HtmlUnescapeMap([112, 108, 117, 115, 109, 110], 177), // "plusmn" => "±"
	HtmlUnescapeMap([109, 105, 100, 100, 111, 116], 183), // "middot" => "·"
	HtmlUnescapeMap([102, 114, 97, 99, 49, 52], 188), // "frac14" => "¼"
	HtmlUnescapeMap([102, 114, 97, 99, 49, 50], 189), // "frac12" => "½"
	HtmlUnescapeMap([102, 114, 97, 99, 51, 52], 190), // "frac34" => "¾"
	HtmlUnescapeMap([105, 113, 117, 101, 115, 116], 191), // "iquest" => "¿"
	HtmlUnescapeMap([65, 103, 114, 97, 118, 101], 192), // "Agrave" => "À"
	HtmlUnescapeMap([65, 97, 99, 117, 116, 101], 193), // "Aacute" => "Á"
	HtmlUnescapeMap([65, 116, 105, 108, 100, 101], 195), // "Atilde" => "Ã"
	HtmlUnescapeMap([67, 99, 101, 100, 105, 108], 199), // "Ccedil" => "Ç"
	HtmlUnescapeMap([69, 103, 114, 97, 118, 101], 200), // "Egrave" => "È"
	HtmlUnescapeMap([69, 97, 99, 117, 116, 101], 201), // "Eacute" => "É"
	HtmlUnescapeMap([73, 103, 114, 97, 118, 101], 204), // "Igrave" => "Ì"
	HtmlUnescapeMap([73, 97, 99, 117, 116, 101], 205), // "Iacute" => "Í"
	HtmlUnescapeMap([78, 116, 105, 108, 100, 101], 209), // "Ntilde" => "Ñ"
	HtmlUnescapeMap([79, 103, 114, 97, 118, 101], 210), // "Ograve" => "Ò"
	HtmlUnescapeMap([79, 97, 99, 117, 116, 101], 211), // "Oacute" => "Ó"
	HtmlUnescapeMap([79, 116, 105, 108, 100, 101], 213), // "Otilde" => "Õ"
	HtmlUnescapeMap([79, 115, 108, 97, 115, 104], 216), // "Oslash" => "Ø"
	HtmlUnescapeMap([85, 103, 114, 97, 118, 101], 217), // "Ugrave" => "Ù"
	HtmlUnescapeMap([85, 97, 99, 117, 116, 101], 218), // "Uacute" => "Ú"
	HtmlUnescapeMap([89, 97, 99, 117, 116, 101], 221), // "Yacute" => "Ý"
	HtmlUnescapeMap([97, 103, 114, 97, 118, 101], 224), // "agrave" => "à"
	HtmlUnescapeMap([97, 97, 99, 117, 116, 101], 225), // "aacute" => "á"
	HtmlUnescapeMap([97, 116, 105, 108, 100, 101], 227), // "atilde" => "ã"
	HtmlUnescapeMap([99, 99, 101, 100, 105, 108], 231), // "ccedil" => "ç"
	HtmlUnescapeMap([101, 103, 114, 97, 118, 101], 232), // "egrave" => "è"
	HtmlUnescapeMap([101, 97, 99, 117, 116, 101], 233), // "eacute" => "é"
	HtmlUnescapeMap([105, 103, 114, 97, 118, 101], 236), // "igrave" => "ì"
	HtmlUnescapeMap([105, 97, 99, 117, 116, 101], 237), // "iacute" => "í"
	HtmlUnescapeMap([110, 116, 105, 108, 100, 101], 241), // "ntilde" => "ñ"
	HtmlUnescapeMap([111, 103, 114, 97, 118, 101], 242), // "ograve" => "ò"
	HtmlUnescapeMap([111, 97, 99, 117, 116, 101], 243), // "oacute" => "ó"
	HtmlUnescapeMap([111, 116, 105, 108, 100, 101], 245), // "otilde" => "õ"
	HtmlUnescapeMap([100, 105, 118, 105, 100, 101], 247), // "divide" => "÷"
	HtmlUnescapeMap([111, 115, 108, 97, 115, 104], 248), // "oslash" => "ø"
	HtmlUnescapeMap([117, 103, 114, 97, 118, 101], 249), // "ugrave" => "ù"
	HtmlUnescapeMap([117, 97, 99, 117, 116, 101], 250), // "uacute" => "ú"
	HtmlUnescapeMap([121, 97, 99, 117, 116, 101], 253), // "yacute" => "ý"
	HtmlUnescapeMap([83, 99, 97, 114, 111, 110], 352), // "Scaron" => "Š"
	HtmlUnescapeMap([115, 99, 97, 114, 111, 110], 353), // "scaron" => "š"
	HtmlUnescapeMap([76, 97, 109, 98, 100, 97], 923), // "Lambda" => "Λ"
	HtmlUnescapeMap([108, 97, 109, 98, 100, 97], 955), // "lambda" => "λ"
	HtmlUnescapeMap([115, 105, 103, 109, 97, 102], 962), // "sigmaf" => "ς"
	HtmlUnescapeMap([116, 104, 105, 110, 115, 112], 8201), // "thinsp" => " "
	HtmlUnescapeMap([100, 97, 103, 103, 101, 114], 8224), // "dagger" => "†"
	HtmlUnescapeMap([68, 97, 103, 103, 101, 114], 8225), // "Dagger" => "‡"
	HtmlUnescapeMap([104, 101, 108, 108, 105, 112], 8230), // "hellip" => "…"
	HtmlUnescapeMap([112, 101, 114, 109, 105, 108], 8240), // "permil" => "‰"
	HtmlUnescapeMap([108, 115, 97, 113, 117, 111], 8249), // "lsaquo" => "‹"
	HtmlUnescapeMap([114, 115, 97, 113, 117, 111], 8250), // "rsaquo" => "›"
	HtmlUnescapeMap([119, 101, 105, 101, 114, 112], 8472), // "weierp" => "℘"
	HtmlUnescapeMap([102, 111, 114, 97, 108, 108], 8704), // "forall" => "∀"
	HtmlUnescapeMap([108, 111, 119, 97, 115, 116], 8727), // "lowast" => "∗"
	HtmlUnescapeMap([116, 104, 101, 114, 101, 52], 8756), // "there4" => "∴"
	HtmlUnescapeMap([111, 116, 105, 109, 101, 115], 8855), // "otimes" => "⊗"
	HtmlUnescapeMap([108, 102, 108, 111, 111, 114], 8970), // "lfloor" => "⌊"
	HtmlUnescapeMap([114, 102, 108, 111, 111, 114], 8971), // "rfloor" => "⌋"
	HtmlUnescapeMap([115, 112, 97, 100, 101, 115], 9824), // "spades" => "♠"
	HtmlUnescapeMap([104, 101, 97, 114, 116, 115], 9829) // "hearts" => "♥"
]

private let unicodeHtmlUnescapeMapNameLength_7: [HtmlUnescapeMap] = [
	HtmlUnescapeMap([69, 112, 115, 105, 108, 111, 110], 917), // "Epsilon" => "Ε"
	HtmlUnescapeMap([79, 109, 105, 99, 114, 111, 110], 927), // "Omicron" => "Ο"
	HtmlUnescapeMap([85, 112, 115, 105, 108, 111, 110], 933), // "Upsilon" => "Υ"
	HtmlUnescapeMap([101, 112, 115, 105, 108, 111, 110], 949), // "epsilon" => "ε"
	HtmlUnescapeMap([111, 109, 105, 99, 114, 111, 110], 959), // "omicron" => "ο"
	HtmlUnescapeMap([117, 112, 115, 105, 108, 111, 110], 965), // "upsilon" => "υ"
	HtmlUnescapeMap([97, 108, 101, 102, 115, 121, 109], 8501) // "alefsym" => "ℵ"
]

private let unicodeHtmlUnescapeMapNameLength_8: [HtmlUnescapeMap] = [
	HtmlUnescapeMap([116, 104, 101, 116, 97, 115, 121, 109], 977) // "thetasym" => "ϑ"
]

// MARK: - Table for escaping

// Structure as LUT(look up table)
private struct HtmlEscapeMap {
    let unescapingCodes: [unichar]
    let code: unichar
    let count: Int
    init(_ c: unichar, _ u: [unichar]) {
        unescapingCodes = u
        code = c
        count = unescapingCodes.count
    }
}

private let unicodeHtmlEscapeMapForUTF8: [HtmlEscapeMap] = [
    HtmlEscapeMap(34, [38, 113, 117, 111, 116, 59]), // => "quot"
    HtmlEscapeMap(38, [38, 97, 109, 112, 59]), // => "amp"
    HtmlEscapeMap(39, [38, 97, 112, 111, 115, 59]), // => "apos"
    HtmlEscapeMap(60, [38, 108, 116, 59]), // => "lt"
    HtmlEscapeMap(62, [38, 103, 116, 59]), // => "gt"
    HtmlEscapeMap(338, [38, 79, 69, 108, 105, 103, 59]), // => "OElig"
    HtmlEscapeMap(339, [38, 111, 101, 108, 105, 103, 59]), // => "oelig"
    HtmlEscapeMap(352, [38, 83, 99, 97, 114, 111, 110, 59]), // => "Scaron"
    HtmlEscapeMap(353, [38, 115, 99, 97, 114, 111, 110, 59]), // => "scaron"
    HtmlEscapeMap(376, [38, 89, 117, 109, 108, 59]), // => "Yuml"
    HtmlEscapeMap(710, [38, 99, 105, 114, 99, 59]), // => "circ"
    HtmlEscapeMap(732, [38, 116, 105, 108, 100, 101, 59]), // => "tilde"
    HtmlEscapeMap(8194, [38, 101, 110, 115, 112, 59]), // => "ensp"
    HtmlEscapeMap(8195, [38, 101, 109, 115, 112, 59]), // => "emsp"
    HtmlEscapeMap(8201, [38, 116, 104, 105, 110, 115, 112, 59]), // => "thinsp"
    HtmlEscapeMap(8204, [38, 122, 119, 110, 106, 59]), // => "zwnj"
    HtmlEscapeMap(8205, [38, 122, 119, 106, 59]), // => "zwj"
    HtmlEscapeMap(8206, [38, 108, 114, 109, 59]), // => "lrm"
    HtmlEscapeMap(8207, [38, 114, 108, 109, 59]), // => "rlm"
    HtmlEscapeMap(8211, [38, 110, 100, 97, 115, 104, 59]), // => "ndash"
    HtmlEscapeMap(8212, [38, 109, 100, 97, 115, 104, 59]), // => "mdash"
    HtmlEscapeMap(8216, [38, 108, 115, 113, 117, 111, 59]), // => "lsquo"
    HtmlEscapeMap(8217, [38, 114, 115, 113, 117, 111, 59]), // => "rsquo"
    HtmlEscapeMap(8218, [38, 115, 98, 113, 117, 111, 59]), // => "sbquo"
    HtmlEscapeMap(8220, [38, 108, 100, 113, 117, 111, 59]), // => "ldquo"
    HtmlEscapeMap(8221, [38, 114, 100, 113, 117, 111, 59]), // => "rdquo"
    HtmlEscapeMap(8222, [38, 98, 100, 113, 117, 111, 59]), // => "bdquo"
    HtmlEscapeMap(8224, [38, 100, 97, 103, 103, 101, 114, 59]), // => "dagger"
    HtmlEscapeMap(8225, [38, 68, 97, 103, 103, 101, 114, 59]), // => "Dagger"
    HtmlEscapeMap(8240, [38, 112, 101, 114, 109, 105, 108, 59]), // => "permil"
    HtmlEscapeMap(8249, [38, 108, 115, 97, 113, 117, 111, 59]), // => "lsaquo"
    HtmlEscapeMap(8250, [38, 114, 115, 97, 113, 117, 111, 59]), // => "rsaquo"
    HtmlEscapeMap(8364, [38, 101, 117, 114, 111, 59]) // => "euro"
]

// MARK: -

/**
 Comparator for HtmlEscapeMap structure.
 */
private func comp(v1: unichar, v2: HtmlEscapeMap) -> Int {
    if v1 > v2.code {
        return 1
    } else if v1 < v2.code {
        return -1
    } else {
        return 0
    }
}

/**
 Decode, convert unicode scalar value to UTF16 code.
 - parameter unicode: 
 - returns:
 */
private func decodeUnicodeScalar(unicode: UInt) -> [unichar] {
    // This convert algorithm is based on https://en.wikipedia.org/wiki/UTF-16
    let w: UInt  = (unicode & 0b00000000000111110000000000000000) >> 16 - 1
    let x1: UInt = (unicode & 0b00000000000000001111110000000000) >> 10
    let x2: UInt = (unicode & 0b00000000000000000000001111111111) >> 0
    let u1: UInt16 = UInt16((0b11011000 << 8) + (w << 6) + x1)
    let u2: UInt16 = UInt16(UInt(0b11011100 << 8) + x2)
    return [u1, u2]
}

/**
 Encode, convert UTF16 code to unicode scalar value.
 - parameter u1:
 - parameter u2:
 - returns:
 */
private func encodeUTF16(u1: unichar, u2: unichar) -> [UInt]? {
    // This convert algorithm is based on https://en.wikipedia.org/wiki/UTF-16
    guard u1 > (0b11011000 << 8) else { return nil }
    guard u1 < (0b11011100 << 8) else { return nil }
    guard u2 > (0b11011100 << 8) else { return nil }
    guard u2 < (0b11100000 << 8) else { return nil }
    
    let u  = (u1 & 0b0000001111000000) >> 6 + 1
    let x1 = (u1 & 0b0000000000111111)
    let x2 = (u2 & 0b0000001111111111)
    let scalar: UInt = (UInt(u) << 16) + (UInt(x1) << 10) + UInt(x2)
    return (0...3).reversed().map({ (scalar >> ($0 * 8)) & 255 })
}

/**
 Escape a two special character code to string which is composed of UTF16 code.
 - parameter u1:
 - parameter u2:
 - returns:
 */
private func escapeUTF16(u1: unichar, u2: unichar) -> [unichar]? {
    guard let hex = encodeUTF16(u1: u1, u2: u2) else { return nil }
    
    let ampersand = unichar(UInt8(ascii: "&"))
    let semicolon = unichar(UInt8(ascii: ";"))
    let sharp = unichar(UInt8(ascii: "#"))
    let x = unichar(UInt8(ascii: "x"))
    let uc: [unichar] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"].map({unichar(UInt8(ascii: $0))})
    let hexCharacters = hex
        .map({ [Int($0 / 16), Int($0 % 16)] })
        .flatMap({$0})
        .reduce([]) { (result, value) -> [Int] in
            if result.count != 0 || value != 0 { return result + [value] }
            return result
        }
        .map({uc[$0]})
    return [ampersand, sharp, x] + hexCharacters + [semicolon]
}

extension String {
    
    /**
     Returns a new string made from the String by removing all HTML tag.
     */
    public var removingHTMLTags: String {
        let length = utf16.count
        var buffer = [unichar](repeating: 0, count: utf16.count)
        NSString(string: self).getCharacters(&buffer)
        
        let leftParenthesis = unichar(UInt8(ascii: "<"))
        let rightParenthesis = unichar(UInt8(ascii: ">"))
        
        guard let destinationBuffer = NSMutableData(capacity: MemoryLayout<unichar>.size * utf16.count) else { return self }
        var begin = 0
        let end = length
        while let leftIndex = buffer.suffix(from: begin).index(of: leftParenthesis) {
            guard let rightIndex = buffer[leftIndex..<end].index(of: rightParenthesis)?.advanced(by: 1) else { break }
            let range = begin..<leftIndex
            destinationBuffer.append(&buffer + begin, length: MemoryLayout<unichar>.size * range.count)
            begin = rightIndex
        }
        if length - begin > 0 {
            let copyLength = length - begin
            destinationBuffer.append(&buffer + begin, length: MemoryLayout<unichar>.size * copyLength)
        }
        return String(data: destinationBuffer as Data, encoding: .utf16LittleEndian) ?? self
    }
    
    /**
     Returns a new string made from the String by replacing all sequences to be escaped with the matching UTF-8 scalar codes.
     */
    public var escapeHTML: String {
        let length = utf16.count
        let buffer = UnsafeMutablePointer<unichar>.allocate(capacity: utf16.count)
        defer { buffer.deallocate(capacity: utf16.count) }
        NSString(string: self).getCharacters(buffer)
        let margin = 0
        guard let destinationBuffer = NSMutableData(capacity: MemoryLayout<unichar>.size * (utf16.count + margin)) else { return self }
        var start = 0
        for var i in 0..<length {
            if let result = bsearch(with: (buffer + i).pointee, from: unicodeHtmlEscapeMapForUTF8, comparator: comp) {
                let copyLength = i - start
                destinationBuffer.append(buffer + start, length: MemoryLayout<unichar>.size * copyLength)
                let pointer: UnsafeMutablePointer<unichar> = UnsafeMutablePointer(mutating: (result.0.unescapingCodes))
                destinationBuffer.append(pointer, length: MemoryLayout<unichar>.size * result.0.count)
                start = i + 1
            } else if i < length - 1 {
                let u1 = (buffer + i).pointee
                let u2 = (buffer + i + 1).pointee
                if let result = escapeUTF16(u1: u1, u2: u2) {
                    let copyLength = i - start
                    destinationBuffer.append(buffer + start, length: MemoryLayout<unichar>.size * copyLength)
                    let pointer: UnsafeMutablePointer<unichar> = UnsafeMutablePointer(mutating: (result))
                    destinationBuffer.append(pointer, length: MemoryLayout<unichar>.size * result.count)
                    start = i + 2
                    i += 1
                }
            }
        }
        if length - start > 0 {
            let copyLength = length - start
            destinationBuffer.append(buffer + start, length: MemoryLayout<unichar>.size * copyLength)
        }
        return String(data: destinationBuffer as Data, encoding: .utf16LittleEndian) ?? self
    }
    
    /**
     Returns a new string made from the String by replacing all HTML unescaped sequences with the matching UTF-8 characters.
     Original code written by @norio_nomura
     https://gist.github.com/norio-nomura/2a79822004e7c89228300cf19595ca99
     */
    public var unescapeHTML: String {
        var buffer = [unichar](repeating: 0, count: utf16.count)
        NSString(string: self).getCharacters(&buffer)

        var end = buffer.endIndex
        let ampersand = unichar(UInt8(ascii: "&"))
        let semicolon = unichar(UInt8(ascii: ";"))
        let sharp = unichar(UInt8(ascii: "#"))
        let hexPrefixes = ["X", "x"].map { unichar(UInt8(ascii: $0)) }

        while let begin = buffer.prefix(upTo: end).reversed().index(of: ampersand).map({ buffer.index(before: $0.base) }) {
            defer { end = begin }
            // if we don't find a semicolon in the range, we don't have a sequence
            guard let semicolonIndex = buffer[begin..<end].index(of: semicolon) else { continue }
            let range = begin...semicolonIndex
            // a squence must be longer than 3 (&lt;) and less than 11 (&thetasym;)
            // a squence must be longer than 3 (&lt;) and less than 11 (&#Xffffff;)
            // a squence must be longer than 3 (&lt;) and less than 11 (&#9999999;)
            guard 4...10 ~= range.count else { continue }
            do {
                if buffer[begin + 1] == sharp {
                    let char2 = buffer[begin + 2]
                    if hexPrefixes.contains(char2) {
                        // Hex escape squences &#xa3;
                        buffer[range] = ArraySlice(try hexStream2UnicodeChars(utf16Storage: buffer[begin + 3..<semicolonIndex]))
                    } else {
                        // Decimal Sequences &#123;
                        buffer[range] = ArraySlice(try decimalStream2UnicodeChars(utf16Storage: buffer[begin + 2..<semicolonIndex]))
                    }
                } else {
                    // "standard" sequences
                    let escapedNameRange = begin + 1..<semicolonIndex
                    buffer[range] = [try matchUnicodeChars(utf16Storage: buffer[escapedNameRange])]
                }
            } catch { print(error) }
        }
        do {
            return try String(utf16Storage: buffer)
        } catch {
            print(error)
            return self
        }
    }

    /**
     Returns an initialized String object that contains a given number of characters from a given array of Unicode characters.
     Returns a String initialized by converting given data into Unicode characters using a given encoding.
     */
    private init<T>(utf16Storage: T) throws where T: ContiguousStorage, T.Iterator.Element == unichar {
        self = try utf16Storage.withUnsafeBufferPointer {
            guard let p = $0.baseAddress else { throw HTMLSpecialCharactersError.invalidBufferSequence }
            return String(utf16CodeUnits: p, count: $0.count)
        }
    }
}

private protocol ContiguousStorage: Sequence {
    func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Iterator.Element>) throws -> R) rethrows -> R
}

extension Array: ContiguousStorage {}
extension ArraySlice: ContiguousStorage {}
extension ContiguousArray: ContiguousStorage {}

public enum HTMLSpecialCharactersError: Error {
    case invalidHexSquence
    case invalidDecimalSquence
    case invalidEscapeSquence
    case invalidBufferSequence
    case notErrorMatchedUnicode(code: unichar)
}

private func hexStream2UnicodeChars<T>(utf16Storage: T) throws -> [unichar] where T: ContiguousStorage, T.Iterator.Element == unichar {
    let utf16: UInt = try utf16Storage.reduce(0) {
        switch $1 {
        case 48...57: return UInt($0) << 4 + UInt($1) - 48
        case 65...70: return UInt($0) << 4 + UInt($1) - 65 + 10
        case 97...102: return UInt($0) << 4 + UInt($1) - 97 + 10
        default: throw HTMLSpecialCharactersError.invalidHexSquence
        }
    }
    if utf16 < UInt(unichar.max) {
        return [unichar(utf16)]
    } else if utf16 < UInt(0x110000) {
        return decodeUnicodeScalar(unicode: utf16)
    } else {
        throw HTMLSpecialCharactersError.invalidDecimalSquence
    }
}

private func decimalStream2UnicodeChars<T>(utf16Storage: T) throws -> [unichar] where T: ContiguousStorage, T.Iterator.Element == unichar {
    let utf16: UInt = try utf16Storage.reduce(0) {
        switch $1 {
        case 48...57: return UInt($0 * 10) + UInt($1) - 48
        default: throw HTMLSpecialCharactersError.invalidDecimalSquence
        }
    }
    if utf16 < UInt(unichar.max) {
        return [unichar(utf16)]
    } else if utf16 < UInt(0x110000) {
        return decodeUnicodeScalar(unicode: utf16)
    } else {
        throw HTMLSpecialCharactersError.invalidDecimalSquence
    }
}

private func matchUnicodeChars<T>(utf16Storage: T) throws -> unichar where T: ContiguousStorage, T.Iterator.Element == unichar {
    return try utf16Storage.withUnsafeBufferPointer {
        guard let unichars = $0.baseAddress else { throw HTMLSpecialCharactersError.invalidEscapeSquence }
        let length = $0.count
        do {
            try getUnescapeTable(length: length)?.forEach({
                if memcmp($0.unescapingCodes, unichars, MemoryLayout<UniChar>.size * length) == 0 {
                    throw HTMLSpecialCharactersError.notErrorMatchedUnicode(code: $0.code)
                }
            })
            throw HTMLSpecialCharactersError.invalidEscapeSquence
        } catch HTMLSpecialCharactersError.notErrorMatchedUnicode(let code) {
            return code
        }
    }
}

internal func bsearch<T, U>(with key: T, from sortedArray: [U], comparator: (T, U) -> Int) -> (U, Int)? {
    var searchCount = 0
    var startIndex = sortedArray.startIndex
    var endIndex = sortedArray.endIndex
    var range = startIndex..<endIndex
    var middle = startIndex.advanced(by: range.count/2)
    repeat {
        range = startIndex..<endIndex
        middle = startIndex.advanced(by: range.count/2)
        searchCount += 1
        let c = comparator(key, sortedArray[middle])
        if c == 1 {
            startIndex = middle
        } else if c == -1 {
            endIndex = middle
        } else if c == 0 {
            return (sortedArray[middle], searchCount)
        } else {
            return nil
        }
    } while range.count > 1
    return nil
}
