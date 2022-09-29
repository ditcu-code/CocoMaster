//
//  CocoData.swift
//  Tree of Life
//
//  Created by Aditya Cahyo on 25/04/22.
//

import Foundation

enum Coco: String, Codable, CaseIterable {
    case tree = "coco-tree" // no atribution required, free for commercial use
    case leaf = "coco-leaf" // <a href="https://www.flaticon.com/free-icons/leaf" title="leaf icons">Leaf icons created by Freepik - Flaticon</a>
    case fruit = "coco-fruit" // <a href="https://www.flaticon.com/free-icons/coconut" title="coconut icons">Coconut icons created by Good Ware - Flaticon</a>
    case trunk = "coco-trunk" // personal artwork
    case root = "coco-root" // personal artwork
    case flower = "coco-flower" // personal artwork
    case broom = "broom" // personal artwork
    case ketupat = "ketupat" // https://www.kindpng.com/imgv/ixoRmTo_sticker-ketupat-png-download-transparent-background-ketupat-png/
    case husk = "coco-husk" // no atribution required, free for commercial use
    case shell = "coco-shell" // no atribution required, free for commercial use
    case timber = "timber" // no atribution required, free for commercial use
    case water = "coco-water" // no atribution required, free for commercial use
    case meat = "coco-meat" // https://create.vista.com/unlimited/stock-photos/41681217/stock-photo-coconut-fruit-piece-isolated-on/
    case milk = "milk" // <a href="https://www.flaticon.com/free-icons/coconut-milk" title="coconut milk icons">Coconut milk icons created by Smashicons - Flaticon</a>
    case oil = "oil" // <a href="https://www.flaticon.com/free-icons/coconut-oil" title="coconut oil icons">Coconut oil icons created by Freepik - Flaticon</a>
    case nata = "nata" // no atribution required, free for commercial use
    case peat = "peat" // <a href="https://www.flaticon.com/free-icons/soil" title="soil icons">Soil icons created by Smashicons - Flaticon</a>
    case fiber = "fiber" // no atribution required, free for commercial use
    case coal = "charcoal" // no atribution required, free for commercial use
    case dye = "dye" // https://www.pngitem.com/middle/iTbTmbm_transparent-color-powder-png-red-pigment-png-png/
    case medicine = "medicine" // <a href="https://www.flaticon.com/free-icons/traditional-medicine" title="traditional medicine icons">Traditional medicine icons created by surang - Flaticon</a>
    case vinegar = "vinegar" // <a href="https://www.flaticon.com/free-icons/vinegar" title="vinegar icons">Vinegar icons created by Freepik - Flaticon</a>
    case sugar = "sugar" // https://www.pngegg.com/en/png-wczrd
    case smoke = "smoke" // <a href="https://www.flaticon.com/free-icons/oil" title="oil icons">Oil icons created by Eucalyp - Flaticon</a>
    
    var title: String {
        switch self {
        case .tree:
            return "Coconut Tree"
        case .leaf:
            return "Leaves"
        case .fruit:
            return "Fruit"
        case .trunk:
            return "Trunk"
        case .root:
            return "Root"
        case .flower:
            return "Flower"
        case .broom:
            return "Broom"
        case .ketupat:
            return "Ketupat"
        case .husk:
            return "Coconut Husk"
        case .shell:
            return "Shell"
        case .timber:
            return "Timber"
        case .water:
            return "Coconut Water"
        case .meat:
            return "Coconut Meat"
        case .milk:
            return "Coconut Milk"
        case .oil:
            return "Coconut Oil"
        case .nata:
            return "Nata de Coco"
        case .peat:
            return "Cocopeat"
        case .fiber:
            return "Coir"
        case .coal:
            return "Charcoal"
        case .dye:
            return "Dye"
        case .medicine:
            return "Medicine"
        case .vinegar:
            return "Vinegar"
        case .sugar:
            return "Palm sugar"
        case .smoke:
            return "Liquid Smoke"
        }
    }
    
    var info: CocoInfo {
        switch self {
        case .tree:
            return CocoInfo(
                image: .tree,
                description: """
            The coconut tree (Cocos nucifera) is a member of the palm tree family (Arecaceae) and the only living species of the genus Cocos. The term "coconut" (or the archaic "cocoanut") can refer to the whole coconut palm, the seed, or the fruit, which botanically is a drupe, not a nut. The name comes from the old Portuguese word coco, meaning "head" or "skull", after the three indentations on the coconut shell that resemble facial features.
            \nThey are ubiquitous in coastal tropical regions and are a cultural icon of the tropics. The coconut tree provides food, fuel, cosmetics, folk medicine and building materials, among many other uses. The inner flesh of the mature seed, as well as the coconut milk extracted from it, form a regular part of the diets of many people in the tropics and subtropics.
            """, ///https://en.wikipedia.org/wiki/Ketupat
                madeFrom: [],
                separateTo: [.leaf, .flower, .fruit, .trunk, .root],
                processTo: []
            )
        case .leaf:
            return CocoInfo(
                image: .leaf,
                description: "Generally, a normal adult palm produces 12-16 new leaves annually, each bearing a corresponding flower cluster (inflorescence). A leaf remains on the palm for about 3 years and thereafter, shed leaving a permanent scar on the trunk.",
                ///https://www.bioversityinternational.org/fileadmin/bioversity/publications/Web_version/108/ch02.htm
                madeFrom: [.tree],
                separateTo: [],
                processTo: [.broom, .ketupat]
            )
        case .fruit:
            return CocoInfo(
                image: .fruit,
                description: "Botanically, the coconut fruit is a drupe, not a true nut. Like other fruits, it has three layers: exocarp,mesocarp, and endocarp. The exocarp and mesocarp make up the 'husk' of the coconut. The white endosperm (kernel) and a large cavity filled with liquid",
                ///https://www.academia.edu/3490203/Cocos_nucifera_COCONUT_FRUIT_A_REVIEW_OF_ITS_MEDICAL_PROPERTIES
                madeFrom: [.tree],
                separateTo: [.husk, .shell, .water, .meat],
                processTo: []
            )
        case .trunk:
            return CocoInfo(
                image: .trunk,
                description: "The stem develops from the single terminal bud called the 'cabbage' which is the palm's only vegetative growing point. Once formed, the trunk does not change much in diameter. Stem growth is fastest at early stages, which can be as much as 1.5 m per year. The incremental growth rate levels off as the palms grow old; up to 10-15 cm per year at about the 40th year and over. The coconut stem has no cambium. Hence, it cannot regenerate damaged tissues.",
                ///https://www.bioversityinternational.org/fileadmin/bioversity/publications/Web_version/108/ch02.htm
                madeFrom: [.tree],
                separateTo: [],
                processTo: [.timber]
            )
        case .root:
            return CocoInfo(
                image: .root,
                description: "The palm has adventitious roots continually produced from the basal 40 cm or so of the trunk, which is the swollen part or what is termed 'bole', in tall types and in some dwarf hybrids. It has no taproot or root hairs but has lots of primary roots which bear large quantities of rootlets.The main roots grow out somewhat horizontally from the bole and are mostly found within the topsoil. The main branches grow deeper and may extend laterally to as much as 10 m.", ///https://www.bioversityinternational.org/fileadmin/bioversity/publications/Web_version/108/ch02.htm
                madeFrom: [.tree],
                separateTo: [],
                processTo: [.dye, .medicine]
            )
        case .flower:
            return CocoInfo(
                image: .flower,
                description: "Coconut tree/palm is one of the oldest flowering tree in the world, the coconut flowers blossom only after 7 to 10 years. Flowering occurs continuously and with the help of the insects and wind the male flowers pollinate the female flowers. Once the female flowers are pollinated, they become coconuts after a period of 10 months.", ///https://cocoandsouls.com/blogs/news/what-are-coconut-flowers
                madeFrom: [.tree],
                separateTo: [],
                processTo: [.vinegar, .sugar]
            )
        case .broom:
            return CocoInfo(
                image: .broom,
                description: "The coconut broom is made by extracting the stems of the leaves from a coconut palm tree. The stems are usually held together by a ribbon or a strong piece of string or straw.",
                madeFrom: [.leaf],
                separateTo: [],
                processTo: []
            )
        case .ketupat:
            return CocoInfo(
                image: .ketupat,
                description: "Kupat (in Javanese and Sundanese) ketupat (in Indonesian and Malay), or tipat (in Balinese) is a Javanese rice cake packed inside a diamond-shaped container of woven coconut leaf pouch. The coco leaves used in wrapping the rice are always shaped into a triangular or diamond form and stored hanging in bunches in the open air.",
                ///https://en.wikipedia.org/wiki/Ketupat
                madeFrom: [.leaf],
                separateTo: [],
                processTo: []
            )
        case .husk:
            return CocoInfo(
                image: .husk,
                description: "The coconut husk is that 5-10 cm thick fibrous covering of the coconut fruit which envelops the hard shellstructure of 3.5 mm thickness. The external appearance of the husk varies from decidedly dull brown whenfully ripe to bright green when immature. There are other varieties whose husks are golden yellow or yellowbrown.",
                madeFrom: [.fruit],
                separateTo: [],
                processTo: [.peat, .fiber]
            )
        case .shell:
            return CocoInfo(
                image: .shell,
                description: "Coconut shell is the hardest part of coconut which located in side of coconut husk by protecting coconut meat.",
                madeFrom: [.fruit],
                separateTo: [],
                processTo: [.coal, .smoke]
            )
        case .water:
            return CocoInfo(
                image: .water,
                description: "Coconut water is the clear liquid inside coconuts. In early development, it serves as a suspension for the endosperm of the coconut during the nuclear phase of development.",
                madeFrom: [.fruit],
                separateTo: [],
                processTo: [.nata]
            )
        case .timber:
            return CocoInfo(
                image: .timber,
                description: "Coconut timber is a hardwood from coconut palm trees. Coconut timber has many applications as both a structural and interior design material. The harder, high-density timber is suitable for general structural purposes such as pillars, trusses, rafting, furniture, window and door frames, floors, decking and floor joists. Medium density coconut timber can be used for walls, ceiling joists and horizontal studs.",
                madeFrom: [.timber],
                separateTo: [],
                processTo: []
            )
        case .meat:
            return CocoInfo(
                image: .meat,
                description: "Coconut meat is the white, fleshy inside of a coconut. At first, the meat is translucent and jelly-like, but it later hardens at maturity to become white flesh",
                madeFrom: [.fruit],
                separateTo: [],
                processTo: [.milk, .oil]
            )
        case .milk:
            return CocoInfo(
                image: .milk,
                description: "Coconut milk is an opaque, milky-white liquid extracted from the grated pulp of mature coconuts. It is used as a traditional food ingredient in Indonesia such as Beef Rendang, Soto and etc",
                madeFrom: [.meat],
                separateTo: [],
                processTo: []
            )
        case .oil:
            return CocoInfo(
                image: .oil,
                description: "Coconut oil (or coconut butter) is an edible oil derived from the wick, meat, and milk of the coconut palm fruit. It is used as a food oil, and in industrial applications for cosmetics and detergent production.",
                madeFrom: [.meat],
                separateTo: [],
                processTo: []
            )
        case .nata:
            return CocoInfo(
                image: .nata,
                description: "Nata de coco, also marketed as coconut gel, is a chewy, translucent, jelly-like food produced by the fermentation of coconut water, which gels through the production of microbial cellulose by Komagataeibacter xylinus.",
                /// https://en.wikipedia.org/wiki/Nata_de_coco
                madeFrom: [.water],
                separateTo: [],
                processTo: []
            )
        case .peat:
            return CocoInfo(
                image: .peat,
                description: "Cocopeat is a multi purpose growing medium made out of coconut husk. The fibrous coconut husk is pre washed, machine dried, sieved and made free from sand and other contaminations such as animal and plant residue. Cocopeat is a very good alternative to traditional peat moss and Rock wool.",
                /// https://www.ecopeat.com/cocopeat.html
                madeFrom: [.husk],
                separateTo: [],
                processTo: []
            )
        case .fiber:
            return CocoInfo(
                image: .fiber,
                description: "Coir (/ˈkɔɪər/), also called coconut fibre, is a natural fibre extracted from the outer husk of coconut and used in products such as floor mats, doormats, brushes and mattresses. Coir is the fibrous material found between the hard, internal shell and the outer coat of a coconut. Other uses of brown coir (made from ripe coconut) are in upholstery padding, sacking and horticulture. White coir, harvested from unripe coconuts, is used for making finer brushes, string, rope and fishing nets.",
                /// https://en.wikipedia.org/wiki/Coir
                madeFrom: [.husk],
                separateTo: [],
                processTo: []
            )
        case .coal:
            return CocoInfo(
                image: .coal,
                description: "Coconut Charcoal Briquettes are compacted or pressed blocks made of burned coconut shells. One of the main functions is for sisha or hookah burner. Moreover, people also use the lower grade for barbecue purposes.",
                madeFrom: [.shell],
                separateTo: [],
                processTo: []
            )
        case .dye:
            return CocoInfo(
                image: .dye,
                description: "Coconut root can be used as an alternative to natural dyes because it contains color pigments in the form of flavonoids.",
                madeFrom: [.root],
                separateTo: [],
                processTo: []
            )
        case .medicine:
            return CocoInfo(
                image: .medicine,
                description: "Extract coconut root can be used to treat fever and diarrhea",
                madeFrom: [.root],
                separateTo: [],
                processTo: []
            )
        case .vinegar:
            return CocoInfo(
                image: .vinegar,
                description: "Coconut vinegar is made using the sap of the coconut blossom, which is then fermented. This fermentation creates acetic acid, giving it its gloriously tangy taste. An 'all-natural' product, coconut vinegar is great for nurturing your gut's microbiome, largely because it is such a rich source of probiotics.",
                /// https://www.thecoconutcompany.co/blogarchive/2020/7/3/what-is-coconut-vinegar-and-how-can-you-be-a-pro-using-it
                madeFrom: [.flower],
                separateTo: [],
                processTo: []
            )
        case .sugar:
            return CocoInfo(
                image: .sugar,
                description: "Palm sugar is a sweetener made from the sap in coconut palm trees, it has a mild caramel flavor. Palm sugar is considered a healthier alternative to other sweeteners because its production involves minimal processing with no added chemicals.",
                /// https://www.webmd.com/diet/palm-sugar-health-benefits
                madeFrom: [.flower],
                separateTo: [],
                processTo: []
            )
        case .smoke:
            return CocoInfo(
                image: .smoke,
                description: "Liquid smoke is a flavoring agent made by burning coconut shell, capturing the smoke, and then condensing it in a liquid substance. Liquid smoke is used to provide certain foods with a smoky flavor without having to use actual wood smoke and it is traditionally used as a food preservative",
                madeFrom: [.shell],
                separateTo: [],
                processTo: []
            )
        }
    }
}
