# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.3.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.3.0/asc_5.3.0_macOS_arm64'
      sha256 '4d19bb6c23d852eb4d0eaff10c2e54beae1823077c9f1e243833400db964ba84'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.3.0/asc_5.3.0_macOS_amd64'
      sha256 'f0cae59358394b5c23b87a07a6f9dbd638929b2ee7ac9924bad956423ca4a50e'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.3.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.3.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
