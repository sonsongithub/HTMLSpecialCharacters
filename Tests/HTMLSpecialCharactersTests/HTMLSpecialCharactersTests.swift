//
//  HTMLSpecialCharactersTests.swift
//  HTMLSpecialCharactersTests
//
//  Created by sonson on 2017/02/09.
//  Copyright © 2017年 sonson. All rights reserved.
//

import Foundation
import XCTest

@testable import HTMLSpecialCharacters

class HTMLSpecialCharactersTests: XCTestCase {
    
    // MARK: - Test for removing HTML tags
    
    override func setUp() {
        super.setUp()
        
        do {
            if let data = stringToBeUnescaped.data(using: .unicode) {
                _ = try NSAttributedString(data: data, options:
                    [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            }
        } catch {
            print(error)
        }
    }
    
    func testRemovingHTMLTags() {
        let data: [(String, String)] = [
            ("aaa <hoge>baaa<br><", "aaa baaa<"),
            ("<dhafhdsaihfiufhdsjkhfeifhhfifhiu>", ""),
            ("dhafhdsaihfiufhdsjkhfeifhhfifhiu", "dhafhdsaihfiufhdsjkhfeifhhfifhiu"),
            ("<dh><>af<<<>hdsaihfiufhdsjkhfeifhhfifhiu", "afhdsaihfiufhdsjkhfeifhhfifhiu")
        ]
        
        data.forEach({
            XCTAssert($0.0.removingHTMLTags == $0.1, $0.0)
        })
    }
    
    // MARK: - Test for handling HTML emoji
    
    func testEmoji() {
        let escaped = "&#128570;はかわいい"
        let escapedHex = "&#x1F63A;はかわいい"
        let unescaped = "😺はかわいい"
        XCTAssert(escaped.unescapeHTML == unescaped)
        XCTAssert(unescaped.escapeHTML == escapedHex)
        XCTAssert(escaped.unescapeHTML.escapeHTML == escapedHex)
    }
    
    func testAllEmoji() {
        let couples: [(String, String)] = [("&#x1F004;", "🀄"), ("&#x1F0CF;", "🃏"), ("&#x1F170;", "🅰"), ("&#x1F171;", "🅱"), ("&#x1F17E;", "🅾"), ("&#x1F17F;", "🅿"), ("&#x1F18E;", "🆎"), ("&#x1F191;", "🆑"), ("&#x1F192;", "🆒"), ("&#x1F193;", "🆓"), ("&#x1F194;", "🆔"), ("&#x1F195;", "🆕"), ("&#x1F196;", "🆖"), ("&#x1F197;", "🆗"), ("&#x1F198;", "🆘"), ("&#x1F199;", "🆙"), ("&#x1F19A;", "🆚"), ("&#x1F201;", "🈁"), ("&#x1F202;", "🈂"), ("&#x1F21A;", "🈚"), ("&#x1F22F;", "🈯"), ("&#x1F232;", "🈲"), ("&#x1F233;", "🈳"), ("&#x1F234;", "🈴"), ("&#x1F235;", "🈵"), ("&#x1F236;", "🈶"), ("&#x1F237;", "🈷"), ("&#x1F238;", "🈸"), ("&#x1F239;", "🈹"), ("&#x1F23A;", "🈺"), ("&#x1F250;", "🉐"), ("&#x1F251;", "🉑"), ("&#x1F300;", "🌀"), ("&#x1F301;", "🌁"), ("&#x1F302;", "🌂"), ("&#x1F303;", "🌃"), ("&#x1F304;", "🌄"), ("&#x1F305;", "🌅"), ("&#x1F306;", "🌆"), ("&#x1F307;", "🌇"), ("&#x1F308;", "🌈"), ("&#x1F309;", "🌉"), ("&#x1F30A;", "🌊"), ("&#x1F30B;", "🌋"), ("&#x1F30C;", "🌌"), ("&#x1F30F;", "🌏"), ("&#x1F311;", "🌑"), ("&#x1F313;", "🌓"), ("&#x1F314;", "🌔"), ("&#x1F315;", "🌕"), ("&#x1F319;", "🌙"), ("&#x1F31B;", "🌛"), ("&#x1F31F;", "🌟"), ("&#x1F320;", "🌠"), ("&#x1F330;", "🌰"), ("&#x1F331;", "🌱"), ("&#x1F334;", "🌴"), ("&#x1F335;", "🌵"), ("&#x1F337;", "🌷"), ("&#x1F338;", "🌸"), ("&#x1F339;", "🌹"), ("&#x1F33A;", "🌺"), ("&#x1F33B;", "🌻"), ("&#x1F33C;", "🌼"), ("&#x1F33D;", "🌽"), ("&#x1F33E;", "🌾"), ("&#x1F33F;", "🌿"), ("&#x1F340;", "🍀"), ("&#x1F341;", "🍁"), ("&#x1F342;", "🍂"), ("&#x1F343;", "🍃"), ("&#x1F344;", "🍄"), ("&#x1F345;", "🍅"), ("&#x1F346;", "🍆"), ("&#x1F347;", "🍇"), ("&#x1F348;", "🍈"), ("&#x1F349;", "🍉"), ("&#x1F34A;", "🍊"), ("&#x1F34C;", "🍌"), ("&#x1F34D;", "🍍"), ("&#x1F34E;", "🍎"), ("&#x1F34F;", "🍏"), ("&#x1F351;", "🍑"), ("&#x1F352;", "🍒"), ("&#x1F353;", "🍓"), ("&#x1F354;", "🍔"), ("&#x1F355;", "🍕"), ("&#x1F356;", "🍖"), ("&#x1F357;", "🍗"), ("&#x1F358;", "🍘"), ("&#x1F359;", "🍙"), ("&#x1F35A;", "🍚"), ("&#x1F35B;", "🍛"), ("&#x1F35C;", "🍜"), ("&#x1F35D;", "🍝"), ("&#x1F35E;", "🍞"), ("&#x1F35F;", "🍟"), ("&#x1F360;", "🍠"), ("&#x1F361;", "🍡"), ("&#x1F362;", "🍢"), ("&#x1F363;", "🍣"), ("&#x1F364;", "🍤"), ("&#x1F365;", "🍥"), ("&#x1F366;", "🍦"), ("&#x1F367;", "🍧"), ("&#x1F368;", "🍨"), ("&#x1F369;", "🍩"), ("&#x1F36A;", "🍪"), ("&#x1F36B;", "🍫"), ("&#x1F36C;", "🍬"), ("&#x1F36D;", "🍭"), ("&#x1F36E;", "🍮"), ("&#x1F36F;", "🍯"), ("&#x1F370;", "🍰"), ("&#x1F371;", "🍱"), ("&#x1F372;", "🍲"), ("&#x1F373;", "🍳"), ("&#x1F374;", "🍴"), ("&#x1F375;", "🍵"), ("&#x1F376;", "🍶"), ("&#x1F377;", "🍷"), ("&#x1F378;", "🍸"), ("&#x1F379;", "🍹"), ("&#x1F37A;", "🍺"), ("&#x1F37B;", "🍻"), ("&#x1F380;", "🎀"), ("&#x1F381;", "🎁"), ("&#x1F382;", "🎂"), ("&#x1F383;", "🎃"), ("&#x1F384;", "🎄"), ("&#x1F385;", "🎅"), ("&#x1F386;", "🎆"), ("&#x1F387;", "🎇"), ("&#x1F388;", "🎈"), ("&#x1F389;", "🎉"), ("&#x1F38A;", "🎊"), ("&#x1F38B;", "🎋"), ("&#x1F38C;", "🎌"), ("&#x1F38D;", "🎍"), ("&#x1F38E;", "🎎"), ("&#x1F38F;", "🎏"), ("&#x1F390;", "🎐"), ("&#x1F391;", "🎑"), ("&#x1F392;", "🎒"), ("&#x1F393;", "🎓"), ("&#x1F3A0;", "🎠"), ("&#x1F3A1;", "🎡"), ("&#x1F3A2;", "🎢"), ("&#x1F3A3;", "🎣"), ("&#x1F3A4;", "🎤"), ("&#x1F3A5;", "🎥"), ("&#x1F3A6;", "🎦"), ("&#x1F3A7;", "🎧"), ("&#x1F3A8;", "🎨"), ("&#x1F3A9;", "🎩"), ("&#x1F3AA;", "🎪"), ("&#x1F3AB;", "🎫"), ("&#x1F3AC;", "🎬"), ("&#x1F3AD;", "🎭"), ("&#x1F3AE;", "🎮"), ("&#x1F3AF;", "🎯"), ("&#x1F3B0;", "🎰"), ("&#x1F3B1;", "🎱"), ("&#x1F3B2;", "🎲"), ("&#x1F3B3;", "🎳"), ("&#x1F3B4;", "🎴"), ("&#x1F3B5;", "🎵"), ("&#x1F3B6;", "🎶"), ("&#x1F3B7;", "🎷"), ("&#x1F3B8;", "🎸"), ("&#x1F3B9;", "🎹"), ("&#x1F3BA;", "🎺"), ("&#x1F3BB;", "🎻"), ("&#x1F3BC;", "🎼"), ("&#x1F3BD;", "🎽"), ("&#x1F3BE;", "🎾"), ("&#x1F3BF;", "🎿"), ("&#x1F3C0;", "🏀"), ("&#x1F3C1;", "🏁"), ("&#x1F3C2;", "🏂"), ("&#x1F3C3;", "🏃"), ("&#x1F3C4;", "🏄"), ("&#x1F3C6;", "🏆"), ("&#x1F3C8;", "🏈"), ("&#x1F3CA;", "🏊"), ("&#x1F3E0;", "🏠"), ("&#x1F3E1;", "🏡"), ("&#x1F3E2;", "🏢"), ("&#x1F3E3;", "🏣"), ("&#x1F3E5;", "🏥"), ("&#x1F3E6;", "🏦"), ("&#x1F3E7;", "🏧"), ("&#x1F3E8;", "🏨"), ("&#x1F3E9;", "🏩"), ("&#x1F3EA;", "🏪"), ("&#x1F3EB;", "🏫"), ("&#x1F3EC;", "🏬"), ("&#x1F3ED;", "🏭"), ("&#x1F3EE;", "🏮"), ("&#x1F3EF;", "🏯"), ("&#x1F3F0;", "🏰"), ("&#x1F40C;", "🐌"), ("&#x1F40D;", "🐍"), ("&#x1F40E;", "🐎"), ("&#x1F411;", "🐑"), ("&#x1F412;", "🐒"), ("&#x1F414;", "🐔"), ("&#x1F417;", "🐗"), ("&#x1F418;", "🐘"), ("&#x1F419;", "🐙"), ("&#x1F41A;", "🐚"), ("&#x1F41B;", "🐛"), ("&#x1F41C;", "🐜"), ("&#x1F41D;", "🐝"), ("&#x1F41E;", "🐞"), ("&#x1F41F;", "🐟"), ("&#x1F420;", "🐠"), ("&#x1F421;", "🐡"), ("&#x1F422;", "🐢"), ("&#x1F423;", "🐣"), ("&#x1F424;", "🐤"), ("&#x1F425;", "🐥"), ("&#x1F426;", "🐦"), ("&#x1F427;", "🐧"), ("&#x1F428;", "🐨"), ("&#x1F429;", "🐩"), ("&#x1F42B;", "🐫"), ("&#x1F42C;", "🐬"), ("&#x1F42D;", "🐭"), ("&#x1F42E;", "🐮"), ("&#x1F42F;", "🐯"), ("&#x1F430;", "🐰"), ("&#x1F431;", "🐱"), ("&#x1F432;", "🐲"), ("&#x1F433;", "🐳"), ("&#x1F434;", "🐴"), ("&#x1F435;", "🐵"), ("&#x1F436;", "🐶"), ("&#x1F437;", "🐷"), ("&#x1F438;", "🐸"), ("&#x1F439;", "🐹"), ("&#x1F43A;", "🐺"), ("&#x1F43B;", "🐻"), ("&#x1F43C;", "🐼"), ("&#x1F43D;", "🐽"), ("&#x1F43E;", "🐾"), ("&#x1F440;", "👀"), ("&#x1F442;", "👂"), ("&#x1F443;", "👃"), ("&#x1F444;", "👄"), ("&#x1F445;", "👅"), ("&#x1F446;", "👆"), ("&#x1F447;", "👇"), ("&#x1F448;", "👈"), ("&#x1F449;", "👉"), ("&#x1F44A;", "👊"), ("&#x1F44B;", "👋"), ("&#x1F44C;", "👌"), ("&#x1F44D;", "👍"), ("&#x1F44E;", "👎"), ("&#x1F44F;", "👏"), ("&#x1F450;", "👐"), ("&#x1F451;", "👑"), ("&#x1F452;", "👒"), ("&#x1F453;", "👓"), ("&#x1F454;", "👔"), ("&#x1F455;", "👕"), ("&#x1F456;", "👖"), ("&#x1F457;", "👗"), ("&#x1F458;", "👘"), ("&#x1F459;", "👙"), ("&#x1F45A;", "👚"), ("&#x1F45B;", "👛"), ("&#x1F45C;", "👜"), ("&#x1F45D;", "👝"), ("&#x1F45E;", "👞"), ("&#x1F45F;", "👟"), ("&#x1F460;", "👠"), ("&#x1F461;", "👡"), ("&#x1F462;", "👢"), ("&#x1F463;", "👣"), ("&#x1F464;", "👤"), ("&#x1F466;", "👦"), ("&#x1F467;", "👧"), ("&#x1F468;", "👨"), ("&#x1F469;", "👩"), ("&#x1F46A;", "👪"), ("&#x1F46B;", "👫"), ("&#x1F46E;", "👮"), ("&#x1F46F;", "👯"), ("&#x1F470;", "👰"), ("&#x1F471;", "👱"), ("&#x1F472;", "👲"), ("&#x1F473;", "👳"), ("&#x1F474;", "👴"), ("&#x1F475;", "👵"), ("&#x1F476;", "👶"), ("&#x1F477;", "👷"), ("&#x1F478;", "👸"), ("&#x1F479;", "👹"), ("&#x1F47A;", "👺"), ("&#x1F47B;", "👻"), ("&#x1F47C;", "👼"), ("&#x1F47D;", "👽"), ("&#x1F47E;", "👾"), ("&#x1F47F;", "👿"), ("&#x1F480;", "💀"), ("&#x1F481;", "💁"), ("&#x1F482;", "💂"), ("&#x1F483;", "💃"), ("&#x1F484;", "💄"), ("&#x1F485;", "💅"), ("&#x1F486;", "💆"), ("&#x1F487;", "💇"), ("&#x1F488;", "💈"), ("&#x1F489;", "💉"), ("&#x1F48A;", "💊"), ("&#x1F48B;", "💋"), ("&#x1F48C;", "💌"), ("&#x1F48D;", "💍"), ("&#x1F48E;", "💎"), ("&#x1F48F;", "💏"), ("&#x1F490;", "💐"), ("&#x1F491;", "💑"), ("&#x1F492;", "💒"), ("&#x1F493;", "💓"), ("&#x1F494;", "💔"), ("&#x1F495;", "💕"), ("&#x1F496;", "💖"), ("&#x1F497;", "💗"), ("&#x1F498;", "💘"), ("&#x1F499;", "💙"), ("&#x1F49A;", "💚"), ("&#x1F49B;", "💛"), ("&#x1F49C;", "💜"), ("&#x1F49D;", "💝"), ("&#x1F49E;", "💞"), ("&#x1F49F;", "💟"), ("&#x1F4A0;", "💠"), ("&#x1F4A1;", "💡"), ("&#x1F4A2;", "💢"), ("&#x1F4A3;", "💣"), ("&#x1F4A4;", "💤"), ("&#x1F4A5;", "💥"), ("&#x1F4A6;", "💦"), ("&#x1F4A7;", "💧"), ("&#x1F4A8;", "💨"), ("&#x1F4A9;", "💩"), ("&#x1F4AA;", "💪"), ("&#x1F4AB;", "💫"), ("&#x1F4AC;", "💬"), ("&#x1F4AE;", "💮"), ("&#x1F4AF;", "💯"), ("&#x1F4B0;", "💰"), ("&#x1F4B1;", "💱"), ("&#x1F4B2;", "💲"), ("&#x1F4B3;", "💳"), ("&#x1F4B4;", "💴"), ("&#x1F4B5;", "💵"), ("&#x1F4B8;", "💸"), ("&#x1F4B9;", "💹"), ("&#x1F4BA;", "💺"), ("&#x1F4BB;", "💻"), ("&#x1F4BC;", "💼"), ("&#x1F4BD;", "💽"), ("&#x1F4BE;", "💾"), ("&#x1F4BF;", "💿"), ("&#x1F4C0;", "📀"), ("&#x1F4C1;", "📁"), ("&#x1F4C2;", "📂"), ("&#x1F4C3;", "📃"), ("&#x1F4C4;", "📄"), ("&#x1F4C5;", "📅"), ("&#x1F4C6;", "📆"), ("&#x1F4C7;", "📇"), ("&#x1F4C8;", "📈"), ("&#x1F4C9;", "📉"), ("&#x1F4CA;", "📊"), ("&#x1F4CB;", "📋"), ("&#x1F4CC;", "📌"), ("&#x1F4CD;", "📍"), ("&#x1F4CE;", "📎"), ("&#x1F4CF;", "📏"), ("&#x1F4D0;", "📐"), ("&#x1F4D1;", "📑"), ("&#x1F4D2;", "📒"), ("&#x1F4D3;", "📓"), ("&#x1F4D4;", "📔"), ("&#x1F4D5;", "📕"), ("&#x1F4D6;", "📖"), ("&#x1F4D7;", "📗"), ("&#x1F4D8;", "📘"), ("&#x1F4D9;", "📙"), ("&#x1F4DA;", "📚"), ("&#x1F4DB;", "📛"), ("&#x1F4DC;", "📜"), ("&#x1F4DD;", "📝"), ("&#x1F4DE;", "📞"), ("&#x1F4DF;", "📟"), ("&#x1F4E0;", "📠"), ("&#x1F4E1;", "📡"), ("&#x1F4E2;", "📢"), ("&#x1F4E3;", "📣"), ("&#x1F4E4;", "📤"), ("&#x1F4E5;", "📥"), ("&#x1F4E6;", "📦"), ("&#x1F4E7;", "📧"), ("&#x1F4E8;", "📨"), ("&#x1F4E9;", "📩"), ("&#x1F4EA;", "📪"), ("&#x1F4EB;", "📫"), ("&#x1F4EE;", "📮"), ("&#x1F4F0;", "📰"), ("&#x1F4F1;", "📱"), ("&#x1F4F2;", "📲"), ("&#x1F4F3;", "📳"), ("&#x1F4F4;", "📴"), ("&#x1F4F6;", "📶"), ("&#x1F4F7;", "📷"), ("&#x1F4F9;", "📹"), ("&#x1F4FA;", "📺"), ("&#x1F4FB;", "📻"), ("&#x1F4FC;", "📼"), ("&#x1F503;", "🔃"), ("&#x1F50A;", "🔊"), ("&#x1F50B;", "🔋"), ("&#x1F50C;", "🔌"), ("&#x1F50D;", "🔍"), ("&#x1F50E;", "🔎"), ("&#x1F50F;", "🔏"), ("&#x1F510;", "🔐"), ("&#x1F511;", "🔑"), ("&#x1F512;", "🔒"), ("&#x1F513;", "🔓"), ("&#x1F514;", "🔔"), ("&#x1F516;", "🔖"), ("&#x1F517;", "🔗"), ("&#x1F518;", "🔘"), ("&#x1F519;", "🔙"), ("&#x1F51A;", "🔚"), ("&#x1F51B;", "🔛"), ("&#x1F51C;", "🔜"), ("&#x1F51D;", "🔝"), ("&#x1F51E;", "🔞"), ("&#x1F51F;", "🔟"), ("&#x1F520;", "🔠"), ("&#x1F521;", "🔡"), ("&#x1F522;", "🔢"), ("&#x1F523;", "🔣"), ("&#x1F524;", "🔤"), ("&#x1F525;", "🔥"), ("&#x1F526;", "🔦"), ("&#x1F527;", "🔧"), ("&#x1F528;", "🔨"), ("&#x1F529;", "🔩"), ("&#x1F52A;", "🔪"), ("&#x1F52B;", "🔫"), ("&#x1F52E;", "🔮"), ("&#x1F52F;", "🔯"), ("&#x1F530;", "🔰"), ("&#x1F531;", "🔱"), ("&#x1F532;", "🔲"), ("&#x1F533;", "🔳"), ("&#x1F534;", "🔴"), ("&#x1F535;", "🔵"), ("&#x1F536;", "🔶"), ("&#x1F537;", "🔷"), ("&#x1F538;", "🔸"), ("&#x1F539;", "🔹"), ("&#x1F53A;", "🔺"), ("&#x1F53B;", "🔻"), ("&#x1F53C;", "🔼"), ("&#x1F53D;", "🔽"), ("&#x1F550;", "🕐"), ("&#x1F551;", "🕑"), ("&#x1F552;", "🕒"), ("&#x1F553;", "🕓"), ("&#x1F554;", "🕔"), ("&#x1F555;", "🕕"), ("&#x1F556;", "🕖"), ("&#x1F557;", "🕗"), ("&#x1F558;", "🕘"), ("&#x1F559;", "🕙"), ("&#x1F55A;", "🕚"), ("&#x1F55B;", "🕛"), ("&#x1F5FB;", "🗻"), ("&#x1F5FC;", "🗼"), ("&#x1F5FD;", "🗽"), ("&#x1F5FE;", "🗾"), ("&#x1F5FF;", "🗿"), ("&#x1F601;", "😁"), ("&#x1F602;", "😂"), ("&#x1F603;", "😃"), ("&#x1F604;", "😄"), ("&#x1F605;", "😅"), ("&#x1F606;", "😆"), ("&#x1F609;", "😉"), ("&#x1F60A;", "😊"), ("&#x1F60B;", "😋"), ("&#x1F60C;", "😌"), ("&#x1F60D;", "😍"), ("&#x1F60F;", "😏"), ("&#x1F612;", "😒"), ("&#x1F613;", "😓"), ("&#x1F614;", "😔"), ("&#x1F616;", "😖"), ("&#x1F618;", "😘"), ("&#x1F61A;", "😚"), ("&#x1F61C;", "😜"), ("&#x1F61D;", "😝"), ("&#x1F61E;", "😞"), ("&#x1F620;", "😠"), ("&#x1F621;", "😡"), ("&#x1F622;", "😢"), ("&#x1F623;", "😣"), ("&#x1F624;", "😤"), ("&#x1F625;", "😥"), ("&#x1F628;", "😨"), ("&#x1F629;", "😩"), ("&#x1F62A;", "😪"), ("&#x1F62B;", "😫"), ("&#x1F62D;", "😭"), ("&#x1F630;", "😰"), ("&#x1F631;", "😱"), ("&#x1F632;", "😲"), ("&#x1F633;", "😳"), ("&#x1F635;", "😵"), ("&#x1F637;", "😷"), ("&#x1F638;", "😸"), ("&#x1F639;", "😹"), ("&#x1F63A;", "😺"), ("&#x1F63B;", "😻"), ("&#x1F63C;", "😼"), ("&#x1F63D;", "😽"), ("&#x1F63E;", "😾"), ("&#x1F63F;", "😿"), ("&#x1F640;", "🙀"), ("&#x1F645;", "🙅"), ("&#x1F646;", "🙆"), ("&#x1F647;", "🙇"), ("&#x1F648;", "🙈"), ("&#x1F649;", "🙉"), ("&#x1F64A;", "🙊"), ("&#x1F64B;", "🙋"), ("&#x1F64C;", "🙌"), ("&#x1F64D;", "🙍"), ("&#x1F64E;", "🙎"), ("&#x1F64F;", "🙏"), ("&#x1F680;", "🚀"), ("&#x1F683;", "🚃"), ("&#x1F684;", "🚄"), ("&#x1F685;", "🚅"), ("&#x1F687;", "🚇"), ("&#x1F689;", "🚉"), ("&#x1F68C;", "🚌"), ("&#x1F68F;", "🚏"), ("&#x1F691;", "🚑"), ("&#x1F692;", "🚒"), ("&#x1F693;", "🚓"), ("&#x1F695;", "🚕"), ("&#x1F697;", "🚗"), ("&#x1F699;", "🚙"), ("&#x1F69A;", "🚚"), ("&#x1F6A2;", "🚢"), ("&#x1F6A4;", "🚤"), ("&#x1F6A5;", "🚥"), ("&#x1F6A7;", "🚧"), ("&#x1F6A8;", "🚨"), ("&#x1F6A9;", "🚩"), ("&#x1F6AA;", "🚪"), ("&#x1F6AB;", "🚫"), ("&#x1F6AC;", "🚬"), ("&#x1F6AD;", "🚭"), ("&#x1F6B2;", "🚲"), ("&#x1F6B6;", "🚶"), ("&#x1F6B9;", "🚹"), ("&#x1F6BA;", "🚺"), ("&#x1F6BB;", "🚻"), ("&#x1F6BC;", "🚼"), ("&#x1F6BD;", "🚽"), ("&#x1F6BE;", "🚾"), ("&#x1F6C0;", "🛀")]
        couples.forEach({
            XCTAssert($0.1.escapeHTML == $0.0, "\($0.1)->\($0.1.escapeHTML)")
            XCTAssert($0.0.unescapeHTML == $0.1, "\($0.1)->\($0.1.escapeHTML)")
            XCTAssert($0.0.escapeHTML.unescapeHTML == $0.0, "\($0.1)->\($0.1.escapeHTML)")
        })
    }
    
    // MARK: - Test for handling HTML emoji
    
    func testStringRoundtrippingEscapedHTML() {
        let string = "This test &<>©`\"™®๒०᠐٧~~"
        XCTAssert(string.escapeHTML.unescapeHTML == string, "Error: \(string)")
    }
    
    // MARK: - Test for handling HTML Special characters
    
    let testCount = 1000
    let stringToBeUnescaped = "&quot;&amp;&amp;apos;&lt;&gt;&OElig;&oelig;&Scaron;&scaron;&Yuml;&circ;&tilde;&ensp;&emsp;&thinsp;&zwnj;&zwj;&lrm;&rlm;&ndash;&mdash;&lsquo;&rsquo;&sbquo;&ldquo;&rdquo;&bdquo;&dagger;&Dagger;&permil;&lsaquo;&rsaquo;&euro;hoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahoghoge&copy;a&copy;aaaaa&copy;aaaaahog"
    let stringToBeEscaped = "\"&&apos;<>ŒœŠšŸˆ˜   ‌‍‎‏–—‘’‚“”„†‡‰‹›€hoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahoghoge©a©aaaaa©aaaaahog"
    
    let escape1 = "&quot;"
    
    func testUnescapePerformance() {
        self.measure {
            for _ in 0..<self.testCount {
                _ = self.escape1.unescapeHTML
            }
        }
    }
    
    let escape100 = "&quot;&amp;&amp;apos;&lt;&quot;&amp;&amp;apos;&lt;&Yuml;&circ;&quot;&amp;&amp;apos;&lt;&quot;&amp;&amp;apos;&lt;&Yuml;&circ;&quot;&amp;&amp;apos;&lt;&quot;&amp;&amp;apos;&lt;&Yuml;&circ;&quot;&amp;&amp;apos;&lt;&quot;&amp;&amp;apos;&lt;&Yuml;&circ;&quot;&amp;&amp;apos;&lt;&quot;&amp;&amp;apos;&lt;&Yuml;&circ;&quot;&amp;&amp;apos;&lt;&quot;&amp;&amp;apos;&lt;&Yuml;&circ;&quot;&amp;&amp;apos;&lt;&quot;&amp;&amp;apos;&lt;&Yuml;&circ;&quot;&amp;&amp;apos;&lt;&quot;&amp;&amp;apos;&lt;&Yuml;&circ;&quot;&amp;&amp;apos;&lt;&quot;&amp;&amp;apos;&lt;&Yuml;&circ;&quot;&amp;&amp;apos;&lt;&quot;&amp;&amp;apos;&lt;&Yuml;&circ;"
    
    func testUnescapePerformanceFor100() {
        self.measure {
            for _ in 0..<self.testCount {
                _ = self.escape100.unescapeHTML
            }
        }
    }
    
    func testEscapePerformance() {
        self.measure {
            for _ in 0..<self.testCount {
                _ = self.stringToBeEscaped.unescapeHTML
            }
        }
    }

    func testStringByEscapingHTML() {
        let chars: [unichar] = [
            34, 38, 39, 60, 62, 338, 339, 352, 353, 376, 710, 732,
            8194, 8195, 8201, 8204, 8205, 8206, 8207, 8211, 8212, 8216, 8217, 8218,
            8220, 8221, 8222, 8224, 8225, 8240, 8249, 8250, 8364
        ]
        let string = "&quot;&amp;&apos;&lt;&gt;&OElig;&oelig;&Scaron;&scaron;&Yuml;" +
        "&circ;&tilde;&ensp;&emsp;&thinsp;&zwnj;&zwj;&lrm;&rlm;&ndash;" +
        "&mdash;&lsquo;&rsquo;&sbquo;&ldquo;&rdquo;&bdquo;&dagger;&Dagger;" +
        "&permil;&lsaquo;&rsaquo;&euro;"
        let pointer: UnsafeMutablePointer<unichar> = UnsafeMutablePointer(mutating: (chars))
        guard let stringToBeEscaped = String(bytesNoCopy: pointer, length: MemoryLayout<unichar>.size * chars.count, encoding: String.Encoding.utf16LittleEndian, freeWhenDone: false) else { XCTFail(); return }
        XCTAssert(stringToBeEscaped.escapeHTML == string, "HTML escaping failed")
        XCTAssert("<this & that>".escapeHTML == "&lt;this &amp; that&gt;", "HTML escaping failed")
        XCTAssert("パン・&ド・カンパーニュ".escapeHTML == "パン・&amp;ド・カンパーニュ", "HTML escaping failed")
        XCTAssert("abcا1ب<تdef&".escapeHTML == "abcا1ب&lt;تdef&amp;", "HTML escaping failed")
        XCTAssert("".escapeHTML == "", "HTML escaping failed")
    }
    
    func testStringByUnescapingHTML() {
        let string = "&quot;&amp;&apos;&lt;&gt;&nbsp;&iexcl;&cent;&pound;&curren;&yen;"
        + "&brvbar;&sect;&uml;&copy;&ordf;&laquo;&not;&shy;&reg;&macr;&deg;"
        + "&plusmn;&sup2;&sup3;&acute;&micro;&para;&middot;&cedil;&sup1;"
        + "&ordm;&raquo;&frac14;&frac12;&frac34;&iquest;&Agrave;&Aacute;"
        + "&Acirc;&Atilde;&Auml;&Aring;&AElig;&Ccedil;&Egrave;&Eacute;"
        + "&Ecirc;&Euml;&Igrave;&Iacute;&Icirc;&Iuml;&ETH;&Ntilde;&Ograve;"
        + "&Oacute;&Ocirc;&Otilde;&Ouml;&times;&Oslash;&Ugrave;&Uacute;"
        + "&Ucirc;&Uuml;&Yacute;&THORN;&szlig;&agrave;&aacute;&acirc;&atilde;"
        + "&auml;&aring;&aelig;&ccedil;&egrave;&eacute;&ecirc;&euml;&igrave;"
        + "&iacute;&icirc;&iuml;&eth;&ntilde;&ograve;&oacute;&ocirc;&otilde;"
        + "&ouml;&divide;&oslash;&ugrave;&uacute;&ucirc;&uuml;&yacute;&thorn;"
        + "&yuml;&OElig;&oelig;&Scaron;&scaron;&Yuml;&fnof;&circ;&tilde;"
        + "&Alpha;&Beta;&Gamma;&Delta;&Epsilon;&Zeta;&Eta;&Theta;&Iota;"
        + "&Kappa;&Lambda;&Mu;&Nu;&Xi;&Omicron;&Pi;&Rho;&Sigma;&Tau;"
        + "&Upsilon;&Phi;&Chi;&Psi;&Omega;&alpha;&beta;&gamma;&delta;"
        + "&epsilon;&zeta;&eta;&theta;&iota;&kappa;&lambda;&mu;&nu;&xi;"
        + "&omicron;&pi;&rho;&sigmaf;&sigma;&tau;&upsilon;&phi;&chi;&psi;"
        + "&omega;&thetasym;&upsih;&piv;&ensp;&emsp;&thinsp;&zwnj;&zwj;"
        + "&lrm;&rlm;&ndash;&mdash;&lsquo;&rsquo;&sbquo;&ldquo;&rdquo;"
        + "&bdquo;&dagger;&Dagger;&bull;&hellip;&permil;&prime;&Prime;"
        + "&lsaquo;&rsaquo;&oline;&frasl;&euro;&weierp;&image;&real;&trade;"
        + "&alefsym;&larr;&uarr;&rarr;&darr;&harr;&crarr;&lArr;&uArr;&rArr;"
        + "&dArr;&hArr;&forall;&part;&exist;&empty;&nabla;&isin;&notin;&ni;"
        + "&prod;&sum;&minus;&lowast;&radic;&prop;&infin;&ang;&and;&or;"
        + "&cap;&cup;&int;&there4;&sim;&cong;&asymp;&ne;&equiv;&le;&ge;"
        + "&sub;&sup;&nsub;&sube;&supe;&oplus;&otimes;&perp;&sdot;&lceil;"
        + "&rceil;&lfloor;&rfloor;&lang;&rang;&loz;&spades;&clubs;&hearts;"
        + "&diams;"

        let chars: [unichar] = [
            34, 38, 39, 60, 62, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170,
            171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185,
            186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200,
            201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215,
            216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230,
            231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245,
            246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 338, 339, 352, 353, 376,
            402, 710, 732, 913, 914, 915, 916, 917, 918, 919, 920, 921, 922, 923, 924,
            925, 926, 927, 928, 929, 931, 932, 933, 934, 935, 936, 937, 945, 946, 947,
            948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 962,
            963, 964, 965, 966, 967, 968, 969, 977, 978, 982, 8194, 8195, 8201, 8204,
            8205, 8206, 8207, 8211, 8212, 8216, 8217, 8218, 8220, 8221, 8222, 8224, 8225,
            8226, 8230, 8240, 8242, 8243, 8249, 8250, 8254, 8260, 8364, 8472, 8465, 8476,
            8482, 8501, 8592, 8593, 8594, 8595, 8596, 8629, 8656, 8657, 8658, 8659, 8660,
            8704, 8706, 8707, 8709, 8711, 8712, 8713, 8715, 8719, 8721, 8722, 8727, 8730,
            8733, 8734, 8736, 8743, 8744, 8745, 8746, 8747, 8756, 8764, 8773, 8776, 8800,
            8801, 8804, 8805, 8834, 8835, 8836, 8838, 8839, 8853, 8855, 8869, 8901, 8968,
            8969, 8970, 8971, 9001, 9002, 9674, 9824, 9827, 9829, 9830
        ]

        let s = string.unescapeHTML

        for i in 0..<chars.count {
            let buffer = UnsafeMutablePointer<unichar>.allocate(capacity: 1)
            defer { buffer.deallocate() }
            buffer.pointee = chars[i]
            guard let testString = String(bytesNoCopy: buffer, length: MemoryLayout<unichar>.size, encoding: String.Encoding.utf16LittleEndian, freeWhenDone: false) else { XCTFail(); return }
            let r = NSRange(location: i, length: 1)
            XCTAssert(testString == (s as NSString).substring(with: r), "\(chars[i])=>\((s as NSString).substring(with: r).unescapeHTML)")
        }

        XCTAssert("&#65;&#x42;&#X43;".unescapeHTML == "ABC", "HTML unescaping failed")
        XCTAssert("".unescapeHTML == "", "HTML unescaping failed")
        XCTAssert("&#65;&Bang;&#X43;".unescapeHTML == "A&Bang;C", "HTML unescaping failed")
        XCTAssert("&#65&Bang;&#X43;".unescapeHTML == "&#65&Bang;C", "HTML unescaping failed")
        XCTAssert("&#65;&Bang;&#X43".unescapeHTML == "A&Bang;&#X43", "HTML unescaping failed")
        XCTAssert("&#65A;".unescapeHTML == "&#65A;", "HTML unescaping failed")
        XCTAssert("&".unescapeHTML == "&", "HTML unescaping failed")
        XCTAssert("&;".unescapeHTML == "&;", "HTML unescaping failed")
        XCTAssert("&x;".unescapeHTML == "&x;", "HTML unescaping failed")
        XCTAssert("&X;".unescapeHTML == "&X;", "HTML unescaping failed")
        XCTAssert(";".unescapeHTML == ";", "HTML unescaping failed")
        XCTAssert("&lt;this &amp; that&gt;".unescapeHTML == "<this & that>", "HTML unescaping failed")
    }
    
    // MARK: - Test for the internal binary search function.

    func testBsearch() {
        let count = 1000
        let candidates1 = Set((0..<count).map({ (_) -> Int in Int(arc4random() % 10000)}))
        let candidates2 = Set((0..<count).map({ (_) -> Int in Int(arc4random() % 10000)}))

        let queries1 = candidates1.intersection(candidates2)
        let queries2 = candidates2.subtracting(queries1)

        func comp(v1: Int, v2: Int) -> Int {
            if v1 > v2 {
                return 1
            } else if v1 < v2 {
                return -1
            } else {
                return 0
            }
        }

        let array = Array(candidates1).sorted()

        queries1.forEach({
            if let result = bsearch(with: $0, from: array, comparator: comp) {
                XCTAssert(result.1 < Int(log2(Double(count)) + 2), "Count of searching is wrong.")
            } else {
                XCTFail("Search is failed.")
            }
        })

        queries2.forEach({
            if bsearch(with: $0, from: array, comparator: comp) != nil {
                XCTFail("Search is failed.")
            } else {
            }
        })
    }
}
