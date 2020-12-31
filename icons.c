/* MiniDLNA media server
 *
 * This file is part of MiniDLNA.
 *
 * Penguin images are the creation of Larry Ewing (lewing@isc.tamu.edu) using The GIMP.
 * NETGEAR images Copyright (c) 2008- NETGEAR, Inc. All Rights Reserved.
 *
 * MiniDLNA is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * MiniDLNA is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with MiniDLNA. If not, see <http://www.gnu.org/licenses/>.
 */

#ifdef NETGEAR
/* NG_Icon_48x48.png */
unsigned char
png_sm[]=
#include "akcol48p"
/* NG_Icon_120x120.png */
unsigned char
png_lrg[]=
#include "akcol120p"
/* NG_Icon_48x48.jpg */
unsigned char
jpeg_sm[]=
#include "akcol48j"
/* NG_Icon_120x120.jpg */
unsigned char
jpeg_lrg[]=
#include "akcol120j"
#elif __FreeBSD__
/* Small Daemon PNG image */
unsigned char
png_sm[]=
#include "akcol48p"
/* Large Daemon PNG image */
unsigned char
png_lrg[]=
#include "akcol120p"
/* Small Daemon JPEG image */
unsigned char
jpeg_sm[]=
#include "akcol48j"
/* Large Daemon JPEG image */
unsigned char
jpeg_lrg[]=
#include "akcol120j"
#else
/* Small Tux PNG image */
unsigned char
png_sm[]=
#include "akcol48p"
/* Large Tux PNG image */
unsigned char
png_lrg[]=
#include "akcol120p"
/* Small Tux JPEG image */
unsigned char
jpeg_sm[]=
#include "akcol48j"
/* Large Tux JPEG image */
unsigned char
jpeg_lrg[]=
#include "akcol120j"
#endif
